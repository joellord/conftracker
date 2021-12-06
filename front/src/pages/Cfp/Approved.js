import React, { Component } from "react";
import Layout from "../../components/Layout";
import { Button, FormGroup, PageSection, PageSectionVariants, Text, TextContent, Checkbox } from "@patternfly/react-core";
import { Redirect } from "react-router-dom";
import API from "../../api";

export default class CfpSubmit extends Component {
  constructor(props) {
    super(props);
    this.state = {
      talks: [],
      cfpId: this.props.match.params.cfpId,
      cfp: {
        conference:""
      },
      approved: [],
      submitted: false
    };
    this.handleSelection = (checked, event) => {
      const target = event.target;
      const talkId = target.name.replace("talk-", "");
      const index = this.state.approved.indexOf(talkId);
      let approved = [...this.state.approved];

      if (checked && index === -1) {
        approved.push(talkId);
      }
      if (!checked && index > -1) {
        approved.splice(index, 1);
      }
      this.setState({approved});
    }
    this.approvedTalks = async () => {
      await API.approvedTalks(this.state.cfpId, this.state.approved);
      this.setState({submitted: true});
    }
    this.updateTalks = async (cfpId) => {
      // let talks = await API.getSubmittedTalks(cfpId);
      // this.setState({ talks });
    }
    this.updateCfp = async (id) => {
      let cfp = await API.getCfp(id);
      this.setState({ cfp, talks: cfp.mySubmissions });
    }
  }

  componentDidMount() {
    this.updateTalks(this.state.cfpId);
    this.updateCfp(this.state.cfpId);
  }

  render() {
    if (this.state.submitted) {
      return <Redirect to='/cfp' />
    }

    return (
      <Layout>
        <PageSection variant={PageSectionVariants.light}>
          <TextContent>
            <Text component="h1">🎉 Congratulations 🎉</Text>
            <Text component="h2">You've been accepted to speak at {this.state.cfp.conference}</Text>
            <Text component="p">
              Which talks were accepted?
            </Text>
            <Text component="p" align="right">
            </Text>
          </TextContent>
        </PageSection>
        <PageSection>
          <FormGroup fieldId="approved">
          {this.state.talks.map(talk => {
            console.log(talk);
            return(
              <Checkbox 
                id={talk.title} 
                label={talk.title} 
                description={talk.abstract} 
                onChange={this.handleSelection}
                name={`talk-${talk.title}`}
                isChecked={this.state.approved.indexOf(talk.title) > -1}
              />
            )
          })}
          </FormGroup>
        </PageSection>
        <PageSection>
          <Button variant="primary" isLarge onClick={this.approvedTalks}>Mark as Approved</Button>
          {" "}
          <Button component="a" href="/cfp" variant="tertiary" isLarge>Cancel</Button>
          <br/>
          <br/>
        </PageSection>
      </Layout>    
    )
  }
}
