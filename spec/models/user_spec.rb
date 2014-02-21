describe User do
  it { should validate_uniqueness_of(:username) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
end
