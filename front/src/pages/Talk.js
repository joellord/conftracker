import React, { Component } from "react";
import Layout from "../components/Layout";
import { Accordion, AccordionContent, AccordionItem, AccordionToggle, Button, Form, FormGroup, Modal, PageSection, PageSectionVariants, Text, TextContent, TextInput, TextArea } from "@patternfly/react-core";
import PlusIcon from "@patternfly/react-icons/dist/js/icons/plus-circle-icon";
import API from "../api";

export default class Cfp extends Component {
  emptyForm = {
    title: "",
    abstract: "",
    notes: ""
  };

  constructor(props) {
    super(props);
    this.state = {
      isModalOpen: false,
      form: this.emptyForm,
      talks: [],
      expanded: []
    };
    this.handleModalToggle = () => {
      this.setState(({ isModalOpen }) => ({
        isModalOpen: !isModalOpen
      }));
    };
    this.saveTalk = async () => {
      await API.postTalk(this.state.form);
      this.handleModalToggle();
      this.setState({form: this.emptyForm});
      this.updateTalks();
    };
    this.handleTextChange = (value, event) => {
      let field = event.target.getAttribute("id");
      this.setState(prev => {
        let form = Object.assign({}, prev.form);
        form[field] = value;
        return {form};
      });
    }
    this.updateTalks = async () => {
      let talks = await API.getTalks();
      this.setState({ talks });
    }
  }

  componentDidMount() {
    this.updateTalks();
  }

  render() {
    const onToggle = id => {
      const expanded = this.state.expanded;
      const index = expanded.indexOf(id);
      const newExpanded = index >= 0 ? [...expanded.slice(0, index), ...expanded.slice(index + 1, expanded.length)] : [...expanded, id];
      this.setState(() => ({ expanded: newExpanded }));
      console.log(newExpanded);
    };
    const { isModalOpen, abstract, title, notes } = this.state;
    return (
      <Layout>
        <PageSection variant={PageSectionVariants.light}>
          <TextContent>
            <Text component="h1">My Talks</Text>
            <Text component="p">
              This is your list of talks with abstracts and more.
            </Text>
            <Text component="p" align="right">
              <PlusIcon onClick={this.handleModalToggle} />
              <Modal 
                width={"50%"} 
                title="Add Talk" 
                isOpen={isModalOpen} 
                onClose={this.handleModalToggle}
                actions={[
                  <Button key="confirm" variant="primary" onClick={this.saveTalk}>Add</Button>,
                  <Button key="cancel" variant="link" onClick={this.handleModalToggle}>Cancel</Button>
                ]}>
                  <Form>
                    <FormGroup label="Title" fieldId="title">
                      <TextInput isRequired type="text" id="title" value={title} onChange={this.handleTextChange} />
                    </FormGroup>
                    <FormGroup label="Abstract" fieldId="abstract">
                      <TextArea isRequired id="abstract" value={abstract} onChange={this.handleTextChange} />
                    </FormGroup>
                    <FormGroup label="Notes" fieldId="notes">
                      <TextArea isRequired id="notes" value={notes} onChange={this.handleTextChange} />
                    </FormGroup>
                  </Form>
                </Modal>
            </Text>
          </TextContent>
        </PageSection>
        <PageSection>
          <Accordion>
            {this.state.talks.map((talk, index) => {
              return(
              <AccordionItem key={index}>
                <AccordionToggle 
                  onClick={() => {onToggle(index)}}
                  isExpanded={this.state.expanded.indexOf(index) > -1}
                  id={index}
                >
                  {talk.title}
                </AccordionToggle>
                <AccordionContent
                  id={`${index}-expanded`}
                  isHidden={this.state.expanded.indexOf(index) === -1}
                >
                  <p>
                    {talk.abstract}
                  </p>
                  <hr />
                  <p>
                    {talk.notes}
                  </p>
                </AccordionContent>
              </AccordionItem>
              )
            })}
          </Accordion>
          <br/>
          <br/>
        </PageSection>
      </Layout>    
    )
  }
}