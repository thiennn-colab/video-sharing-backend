require 'rails_helper'

RSpec.describe '/posts', type: :request do
  describe 'GET /posts' do
    it 'returns a list of posts' do
      FactoryBot.create(:post)
      get posts_path

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).dig("data").size).to eq(1)
    end
  end

  describe 'POST /posts' do
    include_context "when a user has signed in"

    subject(:create_post) do
      post posts_path, headers: headers, params: params
    end

    let(:params) do
      {
        title: 'My Post',
        url: 'https://www.youtube.com/watch?v=Tp6r82DB63Q&ab_channel=mikedawesofficial',
        description: 'This is my post description'
      }
    end

    it 'creates a new post' do
      create_post

      expect(response).to have_http_status(:ok)
      expect(Post.count).to eq(1)
    end

    context "when params invalid" do
      before do
        params[:title] = nil
      end
    end

    context "when user not logged in" do
      before do
        JWTSessions::Session.flush_all
      end

      it "return unauthorized" do
        create_post

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'GET /posts/:id' do
    let!(:post) { FactoryBot.create(:post) }

    it 'returns the details of a post' do
      get post_path(post)

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).dig("data", "title")).to eq(post.title)
    end

    context "when post deleted or not existed" do
      before do
        post.destroy!
      end

      it "return error" do
        get post_path(post)

        expect(response).to have_http_status(:internal_server_error)
      end
    end
  end

  # describe 'PATCH /posts/:id' do
  # end

  describe 'DELETE /posts/:id' do
    include_context "when a user has signed in"

    subject(:delete_post) do
      delete post_path(post), headers: headers
    end
    let!(:post) { FactoryBot.create(:post, user: user) }

    it 'deletes a post' do
      delete_post

      expect(response).to have_http_status(:ok)
      expect(Post.exists?(post.id)).to be_falsy
    end

    context "when user not logged in" do
      before do
        JWTSessions::Session.flush_all
      end

      it "return unauthorized" do
        delete_post

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
