import React, { Component } from "react";
import API from "../api";
import { formatDate } from "../utils/helpers";
import Layout from "../components/Layout";
import Link from "../components/Link";
import { Alert, Button, DataList, DataListCell, DataListItem, DataListItemCells, DataListItemRow, Form, FormGroup, Modal, PageSection, PageSectionVariants, Text, TextContent, TextInput, Tooltip } from "@patternfly/react-core";
import PlusIcon from "@patternfly/react-icons/dist/js/icons/plus-circle-icon";
import CalendarIcon from "@patternfly/react-icons/dist/js/icons/calendar-alt-icon";
import CfpIcon from "@patternfly/react-icons/dist/js/icons/pencil-ruler-icon";
import StatusPendingIcon from "@patternfly/react-icons/dist/js/icons/pending-icon";
import StatusSubmittedIcon from "@patternfly/react-icons/dist/js/icons/check-circle-icon";

const STATUS = {
  PENDING: "Pending",
  SUBMITTED: "Submitted"
};

export default class Cfp extends Component {
  emptyForm = {
    conference: "",
    start_date: "",
    end_date: "",
    cfp_close_date: "",
    url: "",
    cfp_url: ""
  };

  constructor(props) {
    super(props);
    this.state = {
      isModalOpen: false,
      form: this.emptyForm,
      cfpColumns: ["Conference", "Dates", "CFP Close Date", "Status"],
      cfps: []
    };
    this.handleModalToggle = () => {
      this.setState(({ isModalOpen }) => ({
        isModalOpen: !isModalOpen
      }));
    };
    this.saveCFP = async () => {
      await API.postCfp(this.state.form);
      this.handleModalToggle();
      this.setState({form: this.emptyForm});
      this.updateCfps();
    };
    this.handleTextChange = (value, event) => {
      let field = event.target.getAttribute("id");
      this.setState(prev => {
        let form = Object.assign({}, prev.form);
        form[field] = value;
        return {form};
      });
    }
    this.updateCfps = async () => {
      let cfps = await API.getCfps();
      let now = new Date();
      cfps = cfps.map(cfp => {
        cfp.dates = `${formatDate(cfp.start_date)} - ${formatDate(cfp.end_date)}`;
        let cfpClosingDate = new Date(cfp.cfp_close_date);
        cfp.cfp_close_date = formatDate(cfp.cfp_close_date);
        const soonInMs = 10 * 24 * 60 * 60 * 1000;
        if (cfpClosingDate.getTime() - now.getTime() < soonInMs) cfp.closingSoon = true;
        cfp.status = cfp.talks_submitted > 0 ? STATUS.SUBMITTED : STATUS.PENDING;
        return cfp;
      });
      this.setState({ cfps });
    }
  }

  tableActions(rowData, { rowIndex }) {
    return [
      {
        title: <a href={`/cfp/submit/${rowData.id}`}>Submitted</a>,
      },
      {
        title: rowData.cfpLink ? <a href={rowData.cfpLink} target="_blank" rel="noreferrer">CFP</a> : "No CFP Link"
      }
    ]
  }

  componentDidMount() {
    this.updateCfps();
  }

  render() {
    const { isModalOpen, conference, start_date, end_date, cfp_close_date, url, cfp_url } = this.state;

    return (
      <Layout>
        <PageSection variant={PageSectionVariants.light}>
          <TextContent>
            <Text component="h1">List of CFPs</Text>
            <Text component="p">
              Here is a list of CFPs. You can add your own or mark them as submitted.
            </Text>
            <Text component="p" align="right">
              <PlusIcon onClick={this.handleModalToggle} />
              <Modal 
                width={"50%"} 
                title="Add CFP" 
                isOpen={isModalOpen} 
                onClose={this.handleModalToggle}
                actions={[
                  <Button key="confirm" variant="primary" onClick={this.saveCFP}>Add</Button>,
                  <Button key="cancel" variant="link" onClick={this.handleModalToggle}>Cancel</Button>
                ]}>
                  <Form>
                    <FormGroup label="Conference" fieldId="conference">
                      <TextInput isRequired type="text" id="conference" value={conference} onChange={this.handleTextChange} />
                    </FormGroup>
                    <FormGroup label="Start" fieldId="start_date">
                      <TextInput isRequired type="date" id="start_date" value={start_date} onChange={this.handleTextChange} />
                    </FormGroup>
                    <FormGroup label="End" fieldId="end_date">
                      <TextInput isRequired type="date" id="end_date" value={end_date} onChange={this.handleTextChange} />
                    </FormGroup>
                    <FormGroup label="CFP Close Date" fieldId="cfp_close_date">
                      <TextInput isRequired type="date" id="cfp_close_date" value={cfp_close_date} onChange={this.handleTextChange} />
                    </FormGroup>
                    <FormGroup label="Conference Website" fieldId="url">
                      <TextInput isRequired type="text" id="url" value={url} onChange={this.handleTextChange} />
                    </FormGroup>
                    <FormGroup label="CFP URL" fieldId="cfp_url">
                      <TextInput isRequired type="text" id="cfp_url" value={cfp_url} onChange={this.handleTextChange} />
                    </FormGroup>
                  </Form>
                </Modal>
            </Text>
          </TextContent>
        </PageSection>
        <PageSection>
          <DataList aria-label="CFP list" isCompact>
            {this.state.cfps.map(cfp => {
              return (
                <DataListItem id={cfp.id} key={cfp.id}>
                  <DataListItemRow>
                    <DataListItemCells dataListCells={[
                      <DataListCell key="conference">
                        {cfp.conference}
                      </DataListCell>,
                      <DataListCell width={1} key="dates">
                        <CalendarIcon /> {cfp.dates}
                      </DataListCell>,
                      <DataListCell width={1} key="cfpDate">
                        <CfpIcon /> {cfp.cfp_close_date}
                      </DataListCell>,
                      <DataListCell width={1} key="status">
                        {cfp.status === STATUS.PENDING && 
                        <div>
                        <StatusPendingIcon id={`statusIcon-${cfp.id}`} />
                        <Tooltip 
                          content="No talks submitted yet"
                          reference={() => document.getElementById(`statusIcon-${cfp.id}`)}
                        />
                        </div>
                        }
                        {cfp.status === STATUS.SUBMITTED &&
                        <div>
                          <StatusSubmittedIcon id={`statusIcon-${cfp.id}`} />
                          <Tooltip
                            content={`Submitted ${cfp.talks_submitted} talk${cfp.talks_submitted > 1 ? "s" : ""}`}
                            reference={() => document.getElementById(`statusIcon-${cfp.id}`)}
                          />
                        </div>
                        }
                      </DataListCell>
                      ]} 
                    />
                  </DataListItemRow>
                  {cfp.closingSoon && cfp.status === STATUS.PENDING && 
                    <DataListItemRow>
                      <DataListItemCells dataListCells={[
                        <DataListCell key="closingsoon">
                          <Alert variant="warning" isInline title="CFP Closing Soon" />
                        </DataListCell>
                      ]} />
                    </DataListItemRow>
                  }
                  <DataListItemRow>
                    <DataListItemCells dataListCells={[
                      <DataListCell width={1} key="info">
                        Links: {" "}
                        <Link to={cfp.url} external>Website</Link>{" "}
                        <Link to={cfp.cfp_url} external>CFP</Link>
                      </DataListCell>,
                      <DataListCell key="actions">
                        <Link to={`/cfp/submit/${cfp.id}`}>Submit</Link>
                      </DataListCell>
                    ]} />
                  </DataListItemRow>
                </DataListItem>
              )
            })}
          </DataList>
          <br/>
          <br/>
        </PageSection>
      </Layout>    
    )
  }
}