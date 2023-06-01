class NotificationService
  class << self
    def call(user:, post:)
      ActionCable.server.broadcast(
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
