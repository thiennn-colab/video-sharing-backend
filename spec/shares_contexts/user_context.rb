RSpec.shared_context "a user exists" do
  let(:password) { Faker::Internet.password }
  let(:user) { FactoryBot.create(:user, password: password) }
end

RSpec.shared_context "when a user has signed in" do
  let(:user) { FactoryBot.create(:user) }
  let!(:jwt_token) do
    payload = {
      user_id: user.id
    }
    session = JWTSessions::Session.new(payload: payload)
    session.login[:access]
  end
  let(:headers) do
    {
      'Authorization': "Bearer #{jwt_token}"
    }
  end
end
