class CreatePlayersBoardsJoin < ActiveRecord::Migration
  def change
    create_join_table :players, :boards do |t|
      t.index [:player_id, :board_id]
      t.index [:board_id, :player_id]
    end
  end
end
