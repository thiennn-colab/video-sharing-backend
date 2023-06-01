require 'rails_helper'

RSpec.describe YoutubeUrlService do
  describe '.parse_id' do
    it 'returns the video ID from the YouTube URL' do
      url = 'https://www.youtube.com/watch?v=abcd1234&feature=xyz'
      video_id = YoutubeUrlService.parse_id(url: url)

      expect(video_id).to eq('abcd1234')
    end

    it 'returns an empty string if the URL does not contain a video ID' do
      url = 'https://www.youtube.com/watch?feature=xyz'
      video_id = YoutubeUrlService.parse_id(url: url)

      expect(video_id).to eq('')
    end
  end
end
