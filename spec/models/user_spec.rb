require 'spec_helper'

describe User do
  let(:user) {FactoryGirl.build(:user)}

  describe "::new" do
    it "can create a new user" do 
      expect(user).to be_an_instance_of(User)
    end
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it "validates uniqueness of email upon user creation" do
      FactoryGirl.create(:user)
      should validate_uniqueness_of(:email).case_insensitive
    end

    context "password" do
      it { should have_secure_password }
      it { should validate_presence_of(:password) }
      it { should validate_presence_of(:password_confirmation) }
      it { should ensure_length_of(:password).is_at_least(6) }
    end
  end

  describe "associations" do
    it { should have_many(:players) }
    it { should have_many(:games).through(:players) }
  end

  describe "database columns" do
    it { should have_db_column(:name).with_options(null: false) }
    it { should have_db_column(:email).with_options(null: false) }
    it { should have_db_column(:password_digest) }
    it { should have_db_column(:provider) }
    it { should have_db_column(:uid) }
    it { should have_db_column(:oauth_token) }
    it { should have_db_column(:oauth_expires_at) }
  end

end
