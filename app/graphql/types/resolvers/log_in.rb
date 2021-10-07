module Types
  module Resolvers
    class LogIn < GraphQL::Schema::Resolver
      null true
      type Types::AuthResponse, null: false

      argument :handle, String, required: true
      argument :password, String, required: true
      
      def resolve(handle:, password:)
        user = User.find_by(handle: handle)
        user = user&.authenticate(password)
        return unless user

        token = Base64.encode64(user.handle) if user
        {
          user: user,
          token: token
        }
      end
    end
  end
end