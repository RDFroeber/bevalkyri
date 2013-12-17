class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.references :player, null: false, index: true
      t.references :board, null: false, index: true
      t.string :type
      # All Buildings
      t.string :x_cord, null: false
      t.string :y_cord, null: false
      # House and Base
      t.integer :level
      # House and Castle
      t.integer :population
      # Base
      t.string :range

      t.timestamps
    end

    #Adding a Foreign Key constraint for player_id and board_id
    reversible do |dir|
      dir.up do
        execute <<-SQL  #Executes RAW SQL
          ALTER TABLE buildings
          ADD CONSTRAINT fk_players
          FOREIGN KEY (player_id)
          REFERENCES players(id),

          ADD CONSTRAINT fk_boards
          FOREIGN KEY (board_id)
          REFERENCES boards(id)
        SQL
      end
    end
  end
end