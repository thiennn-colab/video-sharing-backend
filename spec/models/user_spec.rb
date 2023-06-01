require 'rails_helper'

RSpec.describe User, type: :model do
  describe "relationship" do
    it { is_expected.to have_many(:posts) }
  end

  describe "validation" do
    let!(:user) { FactoryBot.build(:user) }

    context "when all attributes are valid" do
      it "is valid with valid attributes" do
        expect(user).to be_valid
      end
    end

    context "when user attributes are invalid" do
      it "is not valid without an email" do
        user.email = nil
        expect(user).not_to be_valid
      end

      it "is not valid with a duplicate email" do
        existing_user = FactoryBot.create(:user)
        user.email = existing_user.email
        expect(user).not_to be_valid
      end
    
      it "is not valid without an encrypted password" do
        user.password = nil
        expect(user).not_to be_valid
      end
    end
  end
end
