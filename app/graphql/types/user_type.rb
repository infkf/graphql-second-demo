module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :handle, String, null: false
    field :bio, String, null: true
  end
end