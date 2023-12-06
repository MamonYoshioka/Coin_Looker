require 'rails_helper'

RSpec.describe EndUser, type: :model do
  describe "ゲストログイン" do
    it "ゲストログインできる" do
      end_user = create(:end_user)

      expect(end_user.guest_login).to be_truthy
    end
  end
end
