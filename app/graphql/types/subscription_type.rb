# app/graphql/types/subscription_type.rb

module Types
  class SubscriptionType < GraphQL::Schema::Object
    field :feed_updated, Types::TweetType, null: false, description: "New tweet"

    def feed_updated
      object
    end
  end
end