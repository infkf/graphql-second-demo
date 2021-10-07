module Types
  module Resolvers
    class LookaheadFeed < GraphQL::Schema::Resolver
      type [Types::TweetType], null: false

      argument :created_at_max, GraphQL::Types::ISO8601DateTime, required: false
      argument :limit, Int, required: false
      extras [:lookahead]
      
      def resolve(created_at_max: DateTime.new(0),limit: 200, lookahead:)
        scope = ::Tweet.all
        scope = ::Tweet.includes(:user) if lookahead.selects?(:user)
        scope.where('created_at > ?', created_at_max).limit(limit).order('created_at DESC')
      end
    end
  end
end