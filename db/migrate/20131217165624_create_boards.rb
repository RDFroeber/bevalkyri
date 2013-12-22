class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :terrain_type
      t.boolean :winner, default: false

      t.timestamps
    end
  end
end