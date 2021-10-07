module Types
  class TweetType < Types::BaseObject
    field :id, ID, null: false
    field :message, String, null: false
    field :user, Types::UserType, null: false
    field :username, String, null: false
    field :posted, GraphQL::Types::ISO8601DateTime, null: false

    def username
     '@' + object.user.handle
    end

    def posted
      object.created_at
    end

    # def user
    #   dataloader.with(::Sources::ActiveRecord, ::User).load(object.user_id)
    # end
  end
end