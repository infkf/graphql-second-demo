module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello, Twitter"
    end

    field :log_in, Types::AuthResponse, null: true,
      description: "Signs in the user", resolver: Types::Resolvers::LogIn

    field :sign_up, Types::AuthResponse, null: true,
      description: "Signs in the user", resolver: Types::Resolvers::SignUp
    
    field :tweet, Types::TweetType, null: true,
      description: "Lets a user to tweet", guard: Policies::UserRequired, resolver: Types::Resolvers::Tweet
  end
end
