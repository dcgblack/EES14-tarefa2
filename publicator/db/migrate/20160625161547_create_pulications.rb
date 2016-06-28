class CreatePulications < ActiveRecord::Migration
  def change
    create_table :pulications do |t|
      t.string :public_type
      t.string :nature
      t.string :reach
      t.string :authors
      t.string :organizer
      t.string :vehicle

      t.timestamps null: false
    end
  end
end
