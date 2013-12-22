class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.references :player, null: false, index: true
      t.references :board, null: false, index: true
      t.integer :money, default: 0
      t.integer :influence, default: 0
      t.integer :quests, default: 0
      t.boolean :blood_crown, default: false

      t.timestamps
    end

    # Adding a Foreign Key constraint for player_id and board_id
    reversible do |dir|
      dir.up do
        execute <<-SQL  # Executes RAW SQL
          ALTER TABLE stats
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