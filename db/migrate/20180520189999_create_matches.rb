class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
    	t.references :player_one, index: true, foreign_key: { to_table: :users }
    	t.references :player_two, index: true, foreign_key: { to_table: :users }
    	t.references :player_one_character, index: true, foreign_key: { to_table: :characters }
    	t.references :player_two_character, index: true, foreign_key: { to_table: :characters }
    	t.references :winner_character, index: true, foreign_key: { to_table: :characters }
    	t.references :winner, index: true, foreign_key: { to_table: :users }
    	t.references :stage, index: true, foreign_key: { to_table: :stages }
    	t.boolean :player_one_win, null: false, default: true
    	t.integer :player_one_elo_change
    	t.integer :player_two_elo_change
    	t.string :confirmation_uuid, null: false, default: '0'
    end
  end
end
