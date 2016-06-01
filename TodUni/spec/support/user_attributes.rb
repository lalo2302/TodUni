def user_attributes(overrides = {})
  {
    name: "Test user",
    email: "user@test.com",
    password: "secretpassword",
    password_confirmation: "secretpassword"
  }.merge(overrides)
end
