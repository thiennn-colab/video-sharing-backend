RSpec.describe "/signup", type: :request do
  include_context "a user exists"

  describe "POST /signup" do
    subject(:signup) { post signup_path, params: params }

    let(:params) do
      {
        email: Faker::Internet.email,
        password: "123123",
        confirmPassword: "123123"
      }
    end

    it "returns a successful response" do
      signup
      expect(response).to have_http_status(:ok)
    end

    context "when input existed email" do
      before do
        params[:email] = user.email
      end

      it "return error message" do
        signup
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context "when input invalid password" do
      context "when password is empty" do
        before do
          params[:password] = nil
          params[:confirmPassword] = nil
        end

        it "return error message" do
          signup
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end

      context "when password length is lower than 6 chars" do
        before do
          params[:password] = Faker::Lorem.characters(number: (1..5))
          params[:confirmPassword] = params[:password]
        end

        it "return error message" do
          signup
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end

      context "when confirmPassword != password" do
        before do
          params[:password] = "different"
        end

        it "return error message" do
          signup
          expect(response).to have_http_status(:internal_server_error)
        end
      end
    end
  end
end
