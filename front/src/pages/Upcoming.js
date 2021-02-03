import React, { Component } from "react";
import API from "../api";
import Layout from "../components/Layout";
import { DataList, DataListItem, DataListItemCells, DataListCell, DataListItemRow, PageSection, PageSectionVariants, Text, TextContent } from "@patternfly/react-core";
import Link from "../components/Link";

export default class Cfp extends Component {
  constructor(props) {
    super(props);
    this.state = {
      upcoming: []
    };

    this.updateUpcomingEvents = async () => {
      const upcoming = await API.getUpcomingEvents();
      this.setState({ upcoming });
    }
  }

  componentDidMount() {
    this.updateUpcomingEvents();
  }

  render() {
    return (
      <Layout>
        <PageSection variant={PageSectionVariants.light}>
          <TextContent>
            <Text component="h1">Upcoming Events</Text>
            <Text component="p">
              Events coming up
            </Text>
          </TextContent>
        </PageSection>
        <PageSection>
          <DataList aria-label="Upcoming events list" isCompact>
            {this.state.upcoming.map(u => {
              return (
                <DataListItem id={u.id} key={u.id}>
                  <DataListItemRow>
                    <DataListItemCells dataListCells={[
                      <DataListCell>
                        <div>
                          <Text component="p">{u.conference}</Text>
                        </div>
                      </DataListCell>,
                      <DataListCell>
                        <div>
                          <Text>{u.dates}</Text>
                        </div>
                      </DataListCell>,
                      <DataListCell>
                        <div>
                          <Text>{u.talks}</Text>
                        </div>
                      </DataListCell>
                    ]} />
                  </DataListItemRow>
                  <DataListItemRow>
                    <DataListItemCells dataListCells={[
                      <DataListCell>
                        <div>
                          <Link to={u.url} external>{u.url}</Link>
                        </div>
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