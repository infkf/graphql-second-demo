import React from "react";
import { render } from "react-dom";
import { ApolloProvider, Query } from "react-apollo";
import { createCache, createClient } from "../utils/apollo";
import Container from "react-bootstrap/Container";
import { Row, Col, Card, Spinner } from "react-bootstrap";
import gql from "graphql-tag";
import Subscription from "./subscription";

const TweetsQuery = gql`
  query {
    tweets: lookaheadFeed(createdAtMax: "2006-12-27T00:00:00Z", limit: 5) {
      id
      message
      user {
        handle
      }
    }
  }
`;

const Loader = () => <Spinner animation="border" role="status"></Spinner>;

const App = () => {
  return (
    <ApolloProvider client={createClient(createCache())}>
      <Query query={TweetsQuery}>
        {({ data, loading, subscribeToMore }) => (
          <div>
            {loading && <Loader />}
            {!loading && (
              <Container>
                <Row>
                  <Col>
                    {data.tweets.map((tweet, i) => {
                      return (
                        <Row key={i}>
                          <Card body bg="primary" text="white">
                            <Card.Title>{`@${tweet.user.handle}:`}</Card.Title>
                            <Card.Text>{tweet.message}</Card.Text>
                          </Card>
                        </Row>
                      );
                    })}
                  </Col>
                </Row>
                <Subscription subscribeToMore={subscribeToMore} />
              </Container>
            )}
          </div>
        )}
      </Query>
    </ApolloProvider>
  );
};

render(<App />, document.querySelector("#root"));
