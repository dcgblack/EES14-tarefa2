class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.references :user, index: true, foreign_key: true
      t.references :publication, index: true, foreign_key: true
      t.string :name
      t.string :curriculum_lattes
      t.string :institution

      t.timestamps null: false
    end
  end
end
