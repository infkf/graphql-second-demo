module Types
  module Resolvers
    class Feed < GraphQL::Schema::Resolver
      type [Types::TweetType], null: false

      argument :created_at_max, GraphQL::Types::ISO8601DateTime, required: false
      
      def resolve(created_at_max: DateTime.new(0))
        ::Tweet.where('created_at > ?', created_at_max).order('created_at DESC')
      end
    end
  end
end