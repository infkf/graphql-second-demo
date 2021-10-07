module Types
  module Resolvers
    class SignUp < GraphQL::Schema::Resolver
      null true
      type Types::AuthResponse, null: false

      argument :handle, String, required: true
      argument :password, String, required: true
      argument :password_confirmation, String, required: true
      argument :bio, String, required: false
      
      def resolve(handle:, password:, password_confirmation:, bio: nil)
        user = User.new(handle: handle, password: password, password_confirmation: password_confirmation,
        bio: bio)
        result = user.save
        return unless user
        token = Base64.encode64(user&.handle) if user.present?
        {
          user: user,
          token: token
        }
      end
    end
  end
end