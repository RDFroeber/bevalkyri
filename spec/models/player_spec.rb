require 'spec_helper'

describe Player do
  let(:user) {FactoryGirl.create(:user)}
  let(:player) {FactoryGirl.build(:player)}

  describe "::new" do
    it "can create a new player" do 
      expect(player).to be_an_instance_of(Player)
    end
  end

  describe "validations" do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:crest) }
    it { should validate_presence_of(:color_one) }
  end

  describe "associations" do
    it { should belong_to(:user) }
    it { should have_many(:games) }
    it { should have_many(:boards).through(:games) }
    it { should have_many(:tiles) }
    it { should have_many(:buildings) }
  end

end