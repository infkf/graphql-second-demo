import gql from "graphql-tag";
import React, { useEffect } from "react";

const NewTweetSubscription = gql`
  subscription {
    feedUpdated {
      user {
        handle
      }
      id
      message
    }
  }
`;

const Subscription = ({ subscribeToMore }) => {
  const [, updateState] = React.useState();
  const forceUpdate = React.useCallback(() => updateState({}), []);
  useEffect(() => {
    return subscribeToMore({
      document: NewTweetSubscription,
      updateQuery: (prev, subscriptionData) => {
        return {
          ...prev,
          tweets: [subscriptionData.subscriptionData.data.feedUpdated].concat(
            prev.tweets
          ),
        };
      },
    });
  }, []);
  return null;
};

export default Subscription;
