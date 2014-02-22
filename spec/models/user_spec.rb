describe User do
  it { should validate_uniqueness_of(:username) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should ensure_length_of(:password).is_at_least(6) }

  describe "format of the email" do
    context "when the email is invalid" do
      it "doesn't validate the record" do
        user = FactoryGirl.build(:user, email: "invalid", username: "guillaume", password: "password")
        user.should_not be_valid
      end
    end
    context "when the email is invalid" do
      it "validates the record" do
        user = FactoryGirl.build(:user, email: "guillaume@qratr.fm", username: "guillaume", password: "password")
        user.should be_valid
      end
    end
  end
end
