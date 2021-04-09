class CreateStrains < ActiveRecord::Migration[6.1]
  def change
    create_table :strains do |t|
      t.string :name
      t.string :description
      t.integer :thc_content
      t.references :category, null: false, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
