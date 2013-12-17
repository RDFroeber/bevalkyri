class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :terrain_type
      t.boolean :winner

      t.timestamps
    end
  end
end