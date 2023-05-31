class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :dislikes

  validates :url, format: {
    with: /\A(https:\/\/www.youtube.com\/).+v=.+&.+\z/,
    message: "Invalid URL"
  }
  validates :url, uniqueness: {message: "This video is already uploaded"}
  validates :title, presence: true
end
