def user_attributes(overrides = {})
  {
    name: "Example user",
    email: "user@example.com",
    password: "secret",
    password_confirmation: "secret"
  }.merge(overrides)
end
