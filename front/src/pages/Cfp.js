import React, { Component } from "react";
import API from "../api";
import { formatDate } from "../utils/helpers";
import Layout from "../components/Layout";
import { Table, TableHeader, TableBody } from "@patternfly/react-table";
import { Button, Form, FormGroup, Modal, PageSection, PageSectionVariants, Text, TextContent, TextInput } from "@patternfly/react-core";
import PlusIcon from "@patternfly/react-icons/dist/js/icons/plus-circle-icon";

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
      cfps = cfps.map(cfp => {
        let cells = [];
        cells.push(cfp.conference);
        cells.push(`${formatDate(cfp.start_date)} - ${formatDate(cfp.end_date)}`);
        cells.push(formatDate(cfp.cfp_close_date));
        let status = "Awaiting Submissions";
        console.log(cfp.talks_submitted);
        if (parseInt(cfp.talks_submitted)) status = "Submitted";
        cells.push(status);
        return { cells, cfpLink: cfp.cfp_url, id: cfp.id };
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
          <Table
            actionResolver={this.tableActions}
            cells={this.state.cfpColumns} 
            rows={this.state.cfps}>
            <TableHeader />
            <TableBody />
          </Table>
          <br/>
          <br/>
        </PageSection>
      </Layout>    
    )
  }
}