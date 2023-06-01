require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "#relationship" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:likes) }
    it { is_expected.to have_many(:dislikes) }
  end

  describe "#validation" do
    let!(:post) { FactoryBot.build(:post) }

    context "when all attributes are valid" do
      it "is valid with valid attributes" do
        expect(post).to be_valid
      end
    end

    context "when post attributes are invalid" do
      it "is not valid without a title" do
        post.title = nil
        expect(post).not_to be_valid
      end

      it "is not valid without a url" do
        post.url = nil
        expect(post).not_to be_valid
      end

      it "is not valid with a duplicate url" do
        existing_post = FactoryBot.create(:post)
        post.url = existing_post.url
        expect(post).not_to be_valid
      end

      it "is not valid with an invalid url" do
        existing_post = FactoryBot.create(:post)
        post.url = Faker::Internet.url
        expect(post).not_to be_valid
      end
    end
  end
end
