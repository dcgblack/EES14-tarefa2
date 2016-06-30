class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :title
      t.string :subtitle
      t.string :edition
      t.string :local
      t.string :publishing_company
      t.date :year_of_publication
      t.string :description
      t.string :other
      t.string :category
      t.string :volume
      t.string :publication_number
      t.string :initial_final_page
      t.string :section

      t.timestamps null: false
    end
  end
end
