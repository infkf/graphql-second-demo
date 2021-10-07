module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    field :feed, [Types::TweetType], null: false,
      description: 'Get global feed for an unauthorized user',
      resolver: Types::Resolvers::Feed

    field :lookahead_feed, [Types::TweetType], null: false,
      description: 'Get global feed for an unauthorized user. A better version',
      resolver: Types::Resolvers::LookaheadFeed

    field :me, Types::UserType, null: true, description: 'Get current user'

    def me
      context[:current_user]
    end
  end
end
