require 'spec_helper'

describe Game do
  let(:game) {FactoryGirl.build(:game)}

  describe "::new" do
    it "can create a new game" do 
      expect(game).to be_an_instance_of(Game)
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

end