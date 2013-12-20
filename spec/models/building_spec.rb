require 'spec_helper'

describe Building do
  let(:building) {FactoryGirl.build(:building)}

  describe "::new" do
    it "can create a new building" do 
      expect(building).to be_an_instance_of(Building)
    end
  end

  describe "validations" do
    it { should validate_presence_of(:player_id) }
    it { should validate_presence_of(:board_id) }
    it { should validate_presence_of(:x_cord) }
    it { should validate_presence_of(:y_cord) }
  end

  describe "associations" do
    it { should belong_to(:player) }
    it { should belong_to(:board) }
  end

  describe "database columns" do
    it { should have_db_column(:type) }
    it { should have_db_column(:x_cord).with_options(null: false) }
    it { should have_db_column(:y_cord).with_options(null: false) }
    it { should have_db_column(:level) }
    it { should have_db_column(:population) }
    it { should have_db_column(:range) }
  end

end
