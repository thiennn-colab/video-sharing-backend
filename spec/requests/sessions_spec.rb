RSpec.describe "/login", type: :request do
  include_context "a user exists"

  describe "POST /login" do
    subject(:login) { post login_path, params: params }

    let(:params) do
      {
        email: user.email,
        password: password
      }
    end

    it "returns a successful response" do
      login
      expect(response).to have_http_status(:ok)
    end

    context "when input invalid email" do
      before do
        params[:email] = Faker::Internet.email
      end

      it "return error message" do
        login
        expect(response).to have_http_status(:internal_server_error)
      end
    end

    context "when input invalid password" do
      before do
        params[:password] = Faker::Internet.password
      end

      it "return error message" do
        login
        expect(response).to have_http_status(:internal_server_error)
      end
    end
  end
end
