class NotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'notification_channel'
  end

  def receive(data)
    ActionCable.server.broadcast('notification_channel', data)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
