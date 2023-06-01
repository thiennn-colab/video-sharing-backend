require 'rails_helper'

RSpec.describe NotificationService do
  describe '.call' do
    let(:user) { FactoryBot.create(:user) }
    let(:post) { create(:post) }

    it 'broadcasts a notification message' do
      NotificationService.call(user: user, post: post)

      expect(ActionCable.server).to receive(:broadcast).with(
        'notification_channel',
        {
          message: "#{user.email} shared a video!",
          post_id: post.hashid,
          posted_user: user.email
        }
      )
    end
  end
end

