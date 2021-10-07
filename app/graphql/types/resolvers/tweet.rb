module Types
  module Resolvers
    class Tweet < GraphQL::Schema::Resolver
      null true
      type Types::TweetType, null: true

      argument :msg, String, required: true
      
      def resolve(msg:)
        tweet = context[:current_user].tweet(msg)
        GraphqlSecondDemoSchema.subscriptions.trigger('feedUpdated', {}, tweet)
        tweet
      end
    end
  end
end