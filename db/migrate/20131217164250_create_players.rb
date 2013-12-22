class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.references :user, null: false, index: true
      t.string :name, null: false
      t.string :kingdom
      t.string :crest, null: false
      t.string :color_one, null: false
      t.string :color_two
      t.text :manifesto

      t.timestamps
    end

    # Adding a Foreign Key constraint for user_id
    reversible do |dir|
      dir.up do
        execute <<-SQL  # Executes RAW SQL
          ALTER TABLE players
          ADD CONSTRAINT fk_users
          FOREIGN KEY (user_id)
          REFERENCES users(id)
        SQL
      end
    end
  end
end
