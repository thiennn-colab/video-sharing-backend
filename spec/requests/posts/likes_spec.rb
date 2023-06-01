require 'rails_helper'

RSpec.describe '/posts/:post_id/like', type: :request do
  include_context "when a user has signed in"

  let!(:created_post) { FactoryBot.create(:post, user: user) }

  describe 'POST /posts/:post_id/like' do
    subject(:like_request) do 
      post post_like_path(created_post), headers: headers
    end

    context 'when user like a post' do
      it 'creates a new like' do
        like_request
        expect(response).to have_http_status(:ok)
        expect(Like.count).to eq(1)
      end

      context 'when user already disliked that post' do
        before do
          FactoryBot.create(:dislike, user: user, post: created_post)
        end

        it 'deletes the existing like' do
          like_request
          expect(response).to have_http_status(:ok)
          expect(Dislike.count).to eq(0)
        end
      end

      context 'when user already liked that post' do
        before do
          FactoryBot.create(:like, user: user, post: created_post)
        end

        it 'return error' do
          like_request
          expect(response).to have_http_status(:internal_server_error)
        end
      end
    end

    context "when user not logged in" do
      before do
        JWTSessions::Session.flush_all
      end

      it "return unauthorized" do
        like_request

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'DELETE /posts/:post_id/like' do
    subject(:unlike_request) do 
      delete post_like_path(created_post), headers: headers
    end
    let!(:like) { FactoryBot.create(:like, user: user, post: created_post) }

    context 'when user unlike' do
      it 'deletes the like' do
        unlike_request
        expect(response).to have_http_status(:ok)
        expect(Like.count).to eq(0)
      end
    end

    context 'when user already liked that post' do
      before do
        like.destroy!
      end

      it 'return error' do
        unlike_request
        expect(response).to have_http_status(:internal_server_error)
      end
    end

    context "when user not logged in" do
      before do
        JWTSessions::Session.flush_all
      end

      it "return unauthorized" do
        unlike_request

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
