class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :player, null: false, index: true
      t.references :board, null: false, index: true

      t.timestamps
    end

    # Adding a Foreign Key constraint for player_id and board_id
    reversible do |dir|
      dir.up do
        execute <<-SQL  # Executes RAW SQL
          ALTER TABLE games
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
