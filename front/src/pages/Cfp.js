import React, { Component } from "react";
import API from "../api";
import Layout from "../components/Layout";
import Link from "../components/Link";
import { ActionList, ActionListItem, Alert, Button, DataList, DataListCell, DataListItem, DataListItemCells, DataListItemRow, Form, FormGroup, Modal, PageSection, PageSectionVariants, Text, TextContent, TextInput, ToggleGroup, ToggleGroupItem, Tooltip } from "@patternfly/react-core";
import PlusIcon from "@patternfly/react-icons/dist/js/icons/plus-circle-icon";
import CalendarIcon from "@patternfly/react-icons/dist/js/icons/calendar-alt-icon";
import CfpIcon from "@patternfly/react-icons/dist/js/icons/bullhorn-icon";
import StatusPendingIcon from "@patternfly/react-icons/dist/js/icons/pending-icon";
import StatusSubmittedIcon from "@patternfly/react-icons/dist/js/icons/paper-plane-icon";
import StatusAcceptedIcon from "@patternfly/react-icons/dist/js/icons/calendar-check-icon";
import StatusRejectedIcon from "@patternfly/react-icons/dist/js/icons/times-circle-icon"
import LinkIcon from "@patternfly/react-icons/dist/js/icons/link-icon";
import EditIcon from "@patternfly/react-icons/dist/js/icons/edit-alt-icon";
import IgnoreIcon from "@patternfly/react-icons/dist/js/icons/user-times-icon";

const STATUS = API.CFP_STATUS;

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
      cfps: [],
      filters: {
      }
    };
    this.state.filters[STATUS.ACCEPTED] = false;
    this.state.filters[STATUS.REJECTED] = false;
    this.state.filters[STATUS.PENDING] = true;
    this.state.filters[STATUS.SUBMITTED] = true;
    this.state.filters[STATUS.IGNORED] = false;
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
      let state = Object.assign({}, this.state);
      state.form[field] = value;
      if (field === "start_date" && !this.state.form.end_date) {
        state.form["end_date"] = value;
      }
      this.setState(state);
    }
    this.handleFilter = (isSelected, event) => {
      const id = event.currentTarget.id;
      let state = Object.assign({}, this.state);
      state.filters[id] = isSelected;
      this.setState(state);
    }
    this.updateCfps = async () => {
      let cfps = await API.getCfps();
      this.setState({ cfps });
    }
    this.handleRejection = async (cfpId) => {
      await API.cfpRejected(cfpId);
      this.updateCfps();
    }
    this.handleIgnore = async (cfpId) => {
      await API.cfpIgnored(cfpId);
      this.updateCfps();
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
            <Text component="p" align="left">
              <ToggleGroup aria-label="Filters">
                <ToggleGroupItem text="Accepted" isSelected={this.state.filters.accepted} onChange={this.handleFilter} buttonId="accepted" />
                <ToggleGroupItem text="Rejected" isSelected={this.state.filters.rejected} onChange={this.handleFilter} buttonId="rejected" />
                <ToggleGroupItem text="Submitted" isSelected={this.state.filters.submitted} onChange={this.handleFilter} buttonId="submitted" />
                <ToggleGroupItem text="Pending" isSelected={this.state.filters.pending} onChange={this.handleFilter} buttonId="pending" />
                <ToggleGroupItem text="Ignored" isSelected={this.state.filters.ignored} onChange={this.handleFilter} buttonId="ignored" />
              </ToggleGroup>
            </Text>
          </TextContent>
        </PageSection>
        <PageSection>
          <DataList aria-label="CFP list" isCompact>
            {this.state.cfps.map(cfp => {
              if (!this.state.filters[cfp.status]) return null;
              if (cfp.status === STATUS.PENDING && cfp.cfpExpired) return null;
              return (
                <DataListItem id={cfp.id} key={cfp.id}>
                  <DataListItemRow>
                    <DataListItemCells dataListCells={[
                      <DataListCell key="conference">
                        <div>
                          <Text component="p">{cfp.conference}</Text>
                          <CalendarIcon /> {cfp.dates} <CfpIcon /> {cfp.cfp_close_date}
                        </div>
                        <div>
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
                            />{` | `}
                            <Link to={`cfp/submit/${cfp.id}?edit`}>
                              <EditIcon id={`editIcon-${cfp.id}`} />
                              <Tooltip
                                content={`Edit submissions`}
                                reference={() => document.getElementById(`editIcon-${cfp.id}`)}
                              />
                            </Link>
                          </div>
                          }
                          {cfp.status === STATUS.ACCEPTED &&
                          <div>
                            <StatusAcceptedIcon id={`statusIcon-${cfp.id}`} />
                            <Tooltip
                              content={`${cfp.talks_accepted} talk${cfp.talks_submitted > 1 ? "s" : ""} accepted`}
                              reference={() => document.getElementById(`statusIcon-${cfp.id}`)}
                            />
                          </div>
                          }
                          {cfp.status === STATUS.REJECTED &&
                          <div>
                            <StatusRejectedIcon id={`statusIcon-${cfp.id}`} />
                            <Tooltip
                              content={`All talks were rejected`}
                              reference={() => document.getElementById(`statusIcon-${cfp.id}`)}
                            />
                          </div>
                          }
                          {cfp.status === STATUS.IGNORED &&
                          <div>
                            <IgnoreIcon id={`statusIcon-${cfp.id}`} />
                            <Tooltip
                              content={`User ignored this CFP`}
                              reference={() => document.getElementById(`statusIcon-${cfp.id}`)}
                            />
                          </div>
                          }
                        </div>
                      </DataListCell>
                      ]} 
                    />
                    <DataListItemCells dataListCells={[
                      <DataListCell>
                        <div>
                          <Link to={cfp.url} external><LinkIcon /></Link>
                          {" | "}
                          <Link to={cfp.cfp_url} external><CfpIcon /></Link>
                        </div>
                      </DataListCell>
                    ]} />
                    <DataListItemCells dataListCells={[
                      <DataListCell width={1} key="info">
                        <div>
                          {cfp.status === STATUS.PENDING && 
                            <ActionList>
                              <ActionListItem>
                                <Link to={`/cfp/submit/${cfp.id}`}>
                                  <Button variant="secondary">
                                    Submit
                                  </Button>
                                </Link>
                              </ActionListItem>
                              <ActionListItem>
                                <Button variant="tertiary" onClick={() => this.handleIgnore(cfp.id)}>
                                  Ignore
                                </Button>
                              </ActionListItem>
                            </ActionList>
                          }
                          {cfp.status === STATUS.SUBMITTED &&
                            <ActionList>
                              <ActionListItem>
                                <Link to={`/cfp/approved/${cfp.id}`}>
                                  <Button variant="primary">
                                    Approved
                                  </Button>
                                </Link>
                              </ActionListItem>
                              <ActionListItem>
                                <Button variant="danger" onClick={() => this.handleRejection(cfp.id)}>
                                  Rejected
                                </Button>
                              </ActionListItem>
                            </ActionList>
                          }
                        </div>
                      </DataListCell>
                    ]} />
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