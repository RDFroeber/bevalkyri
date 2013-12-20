require 'spec_helper'

describe Player do
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
    it { should have_one(:stat) }
  end

  describe "database columns" do
    it { should have_db_column(:name).with_options(null: false) }
    it { should have_db_column(:kingdom) }
    it { should have_db_column(:crest).with_options(null: false) }
    it { should have_db_column(:color_one).with_options(null: false) }
    it { should have_db_column(:color_two) }
    it { should have_db_column(:manifesto) }
  end

end
