import React, { Component } from "react";
import Layout from "../../components/Layout";
import { Button, ClipboardCopy, ClipboardCopyVariant, FormGroup, Modal, PageSection, PageSectionVariants, Text, TextContent, Checkbox } from "@patternfly/react-core";
import { Redirect } from "react-router-dom";
import API from "../../api";
import Link from "../../components/Link";
import { IdCardIcon } from "@patternfly/react-icons";

export default class CfpSubmit extends Component {
  constructor(props) {
    super(props);

    let query = new URLSearchParams(this.props.location.search);

    this.state = {
      talks: [],
      cfpId: this.props.match.params.cfpId,
      cfp: {},
      submissions: [],
      submitted: false,
      editing: query.has("edit"),
      isModalOpen: false,
      profileData: []
    };
    this.handleSelection = (checked, event) => {
      const target = event.target;
      const talkId = parseInt(target.name.replace("talk-", ""));
      const index = this.state.submissions.indexOf(talkId);
      let submissions = [...this.state.submissions];

      if (checked && index === -1) {
        submissions.push(talkId);
      }
      if (!checked && index > -1) {
        submissions.splice(index, 1);
      }
      console.log(submissions);
      this.setState({ submissions });
    }
    this.submitTalks = async () => {
      // let talkSubmissions = [];
      // this.state.submissions.map(index => {
      //   talkSubmissions.push(this.state.talks[index]);
      // });
      await API.submitTalks(this.state.cfpId, this.state.submissions, this.state.editing);
      this.setState({ submitted: true });
    }
    this.updateTalks = async () => {
      let talks = await API.getTalks();
      this.setState({ talks });
    }
    this.updateCfp = async (id) => {
      let cfp = await API.getCfp(id);
      this.setState({ cfp });
    }
    this.updateSelection = async (id) => {
      let submissions = await API.getSubmittedTalks(id)
      submissions = submissions.map(talk => talk._id);
      this.setState({ submissions });
    }
    this.handleModalToggle = () => {
      this.setState({isModalOpen: !this.state.isModalOpen});
    }
    this.updateProfile = async () => {
      let profile = await API.getProfile();
      let profileData = profile.profileFields;
      this.setState({ profileData });
    }
  }

  componentDidMount() {
    this.updateTalks();
    this.updateCfp(this.state.cfpId);
    if (this.state.editing) {
      this.updateSelection(this.state.cfpId);
    }
    this.updateProfile();
  }

  render() {
    if (this.state.submitted) {
      return <Redirect to='/cfp' />
    }

    const { isModalOpen, profileData } = this.state;

    return (
      <Layout>
        <PageSection variant={PageSectionVariants.light}>
          <TextContent>
            <Text component="h1">Talk Submission for {this.state.cfp.conference}</Text>
            <Text component="p">
              <Link to={this.state.cfp.cfp_url} external>CFP URL</Link>
            </Text>
            <Text>
              <IdCardIcon onClick={this.handleModalToggle} />
              <Modal 
                width={"50%"} 
                title="CFP Copy&amp;Paste Data" 
                isOpen={isModalOpen} 
                onClose={this.handleModalToggle}
                actions={[
                  <Button key="close" variant="link" onClick={this.handleModalToggle}>Close</Button>
                ]}>
                {profileData.map(field => {
                  return(
                    <React.Fragment>
                      {field.label}
                      <ClipboardCopy isReadOnly variant={ClipboardCopyVariant.expansion}>
                        {field.value}
                      </ClipboardCopy>
                    </React.Fragment>
                  )
                })}
              </Modal>
            </Text>
            <Text component="p">
              Which talks were submitted?
            </Text>
            <Text component="p" align="right">
            </Text>
          </TextContent>
        </PageSection>
        <PageSection>
          <FormGroup fieldId="submissions">
            {this.state.talks.map((talk,index) => {
              return (
                <Checkbox
                  id={index}
                  label={talk.title}
                  description={talk.abstract}
                  onChange={this.handleSelection}
                  name={`talk-${index}`}
                  isChecked={this.state.submissions.indexOf(index) > -1}
                />
              )
            })}
          </FormGroup>
        </PageSection>
        <PageSection>
          <Button variant="primary" isLarge onClick={this.submitTalks}>Mark as Submitted</Button>
          {" "}
          <Link to="/cfp">
            <Button variant="tertiary" isLarge>Cancel</Button>
          </Link>
          <br />
          <br />
        </PageSection>
      </Layout>
    )
  }
}
