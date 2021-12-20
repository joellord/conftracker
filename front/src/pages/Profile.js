import React, { Component } from "react";
import Layout from "../components/Layout";
import { Button, ClipboardCopy, ClipboardCopyVariant, Form, FormGroup, FormSelect, FormSelectOption, Modal, PageSection, PageSectionVariants, Text, TextArea, TextContent, TextInput } from "@patternfly/react-core";
import PlusIcon from "@patternfly/react-icons/dist/js/icons/plus-circle-icon";
import API from "../api";

export default class Cfp extends Component {
  constructor(props) {
    super(props);
    this.state = {
      profile: [],
      modal: {
        fieldType: "link",
        label: "",
        value: ""
      },
      isModalOpen: false
    };

    this.handleModalToggle = () => {
      this.setState({isModalOpen: !this.state.isModalOpen});
    }

    this.saveField = async () => {
      await API.postProfileField(this.state.modal);
      this.updateProfile();
      this.handleModalToggle();
    }

    this.updateProfile = async () => {
      let profile = await API.getProfile();
      let profileFields = profile.profileFields;
      this.setState({profile: profileFields});
    }

    this.onChange = (newValue, e) => {
      const id = e.target.id;
      let state = Object.assign({}, this.state);
      state.modal[id] = newValue;
      this.setState(state);
    }
  }

  componentDidMount() {
    this.updateProfile();
  }

  render() {
    const { isModalOpen, profile, modal } = this.state;
    return (
      <Layout>
        <PageSection variant={PageSectionVariants.light}>
          <TextContent>
            <Text component="h1">Profile</Text>
            <Text component="p">
              Profile and other CFP cut and paste information
            </Text>
          </TextContent>
        </PageSection>

        <PageSection>
        <Text component="p" align="right">
              <PlusIcon onClick={this.handleModalToggle} />
              <Modal 
                width={"50%"} 
                title="Add CFP Cut&amp;Paste info" 
                isOpen={isModalOpen} 
                onClose={this.handleModalToggle}
                actions={[
                  <Button key="confirm" variant="primary" onClick={this.saveField}>Add</Button>,
                  <Button key="cancel" variant="link" onClick={this.handleModalToggle}>Cancel</Button>
                ]}>
                  <Form>
                    <FormGroup label="Type" fieldId="type">
                      <FormSelect
                        value={modal.fieldType}
                        onChange={this.onChange}
                        name="horizontal-form-title"
                        aria-label="Field Type"
                        id="fieldType"
                      >
                        <FormSelectOption key={0} value={"long"} label={"Long field"} />
                        <FormSelectOption key={1} value={"link"} label={"Simple Link"} />

                      </FormSelect>
                    </FormGroup>
                    {modal.fieldType === "link" && 
                    <React.Fragment>
                      <FormGroup label="Label" fieldId="label">
                        <TextInput isRequired id="label" onChange={this.onChange} />
                      </FormGroup>
                      <FormGroup label="Value" fieldId="value">
                        <TextInput isRequired id="value" onChange={this.onChange} />
                      </FormGroup>
                    </React.Fragment>
                    }
                    {modal.fieldType === "long" && 
                    <React.Fragment>
                      <FormGroup label="Label" fieldId="label">
                        <TextInput isRequired id="label" onChange={this.onChange} />
                      </FormGroup>
                      <FormGroup label="Value" fieldId="value">
                        <TextArea id="value" onChange={this.onChange} />
                      </FormGroup>
                    </React.Fragment>
                    }
                  </Form>
                </Modal>
            </Text>
        </PageSection>

        <PageSection className="pf-u-text-left" variant={PageSectionVariants.light}>
          {profile.map(field => {
            return(
              <React.Fragment>
                {field.label}
                <ClipboardCopy isReadOnly variant={ClipboardCopyVariant.expansion}>
                  {field.value}
                </ClipboardCopy>
              </React.Fragment>
            )
          })}
        </PageSection>
      </Layout>    
    )
  }
}