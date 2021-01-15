import React, { Component } from "react";
import Layout from "../../components/Layout";
import { Button, FormGroup, PageSection, PageSectionVariants, Text, TextContent, Checkbox } from "@patternfly/react-core";
import { Redirect } from "react-router-dom";
import API from "../../api";
import Link from "../../components/Link";

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
      editing: query.has("edit")
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
      submissions = submissions.map(talk => talk.id);
      this.setState({ submissions });
    }
  }

  componentDidMount() {
    this.updateTalks();
    this.updateCfp(this.state.cfpId);
    if (this.state.editing) {
      this.updateSelection(this.state.cfpId);
    }
  }

  render() {
    if (this.state.submitted) {
      return <Redirect to='/cfp' />
    }

    return (
      <Layout>
        <PageSection variant={PageSectionVariants.light}>
          <TextContent>
            <Text component="h1">Talk Submission for {this.state.cfp.conference}</Text>
            <Text component="p">
              <Link to={this.state.cfp.cfp_url} external>CFP URL</Link>
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
            {this.state.talks.map(talk => {
              return (
                <Checkbox
                  id={talk.id}
                  label={talk.title}
                  description={talk.abstract}
                  onChange={this.handleSelection}
                  name={`talk-${talk.id}`}
                  isChecked={this.state.submissions.indexOf(talk.id) > -1}
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
