require 'spec_helper'

describe Board do
  let(:board) {FactoryGirl.build(:board)}

  describe "::new" do
    it "can create a new board" do 
      expect(board).to be_an_instance_of(Board)
    end
  end

  describe "associations" do
    it { should have_many(:games) }
    it { should have_many(:players).through(:games) }
    it { should have_many(:tiles) }
    it { should have_many(:buildings) }
  end

  describe "database columns" do
    it { should have_db_column(:terrain_type)}
    it { should have_db_column(:winner).with_options(default: false) }
  end

end