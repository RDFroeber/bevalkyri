require 'spec_helper'

describe Stat do
  let(:player) {FactoryGirl.create(:player)}
  let(:stat) {Stat.new(player_id: player.id)}

  describe "::new" do
    it "can create a new player" do 
      expect(stat).to be_an_instance_of(Stat)
    end
  end

  describe "validations" do
    it { should validate_presence_of(:player_id) }
    it { should validate_presence_of(:board_id) }
  end

  describe "associations" do
    it { should belong_to(:player) }
    it { should belong_to(:board) }
  end

  describe "database columns" do
    it { should have_db_column(:money).with_options(default: 0) }
    it { should have_db_column(:influence).with_options(default: 0) }
    it { should have_db_column(:quests).with_options(default: 0) }
    it { should have_db_column(:blood_crown).with_options(default: false) }
  end

end