require 'rails_helper'

RSpec.describe '/posts/:post_id/dislike', type: :request do
  include_context "when a user has signed in"

  let!(:created_post) { FactoryBot.create(:post, user: user) }

  describe 'POST /posts/:post_id/dislike' do
    subject(:dislike_request) do 
      post post_dislike_path(created_post), headers: headers
    end

    context 'when user dislike a post' do
      it 'creates a new dislike' do
        dislike_request
        expect(response).to have_http_status(:ok)
        expect(Dislike.count).to eq(1)
      end

      context 'when user already liked that post' do
        before do
          FactoryBot.create(:like, user: user, post: created_post)
        end

        it 'deletes the existing like' do
          dislike_request
          expect(response).to have_http_status(:ok)
          expect(Like.count).to eq(0)
        end
      end

      context 'when user already disliked that post' do
        before do
          FactoryBot.create(:dislike, user: user, post: created_post)
        end

        it 'return error' do
          dislike_request
          expect(response).to have_http_status(:internal_server_error)
        end
      end
    end

    context "when user not logged in" do
      before do
        JWTSessions::Session.flush_all
      end

      it "return unauthorized" do
        dislike_request

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'DELETE /posts/:post_id/dislike' do
    subject(:undislike_request) do 
      delete post_dislike_path(created_post), headers: headers
    end
    let!(:dislike) { FactoryBot.create(:dislike, user: user, post: created_post) }

    context 'when user undislike' do
      it 'deletes the dislike' do
        undislike_request
        expect(response).to have_http_status(:ok)
        expect(Dislike.count).to eq(0)
      end
    end

    context 'when user already disliked that post' do
      before do
        dislike.destroy!
      end

      it 'return error' do
        undislike_request
        expect(response).to have_http_status(:internal_server_error)
      end
    end

    context "when user not logged in" do
      before do
        JWTSessions::Session.flush_all
      end

      it "return unauthorized" do
        undislike_request

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
