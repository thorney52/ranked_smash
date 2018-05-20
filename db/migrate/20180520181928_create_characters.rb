class CreateCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :characters do |t|
    	t.string :name, null: false, default: ''
    	t.string :tier, null: false, default: ''
    	t.timestamps
    end
  end
end
