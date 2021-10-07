if Rails.env.development?
  GraphiQL::Rails.config.headers['Authorization'] = -> (_ctx) {
    Base64.encode64(User.first.handle)
  }
end