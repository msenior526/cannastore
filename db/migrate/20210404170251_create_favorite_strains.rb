class CreateFavoriteStrains < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_strains do |t|
      t.references :user, null: false, foreign_key: {on_delete: :cascade}
      t.references :strain, null: false, foreign_key: {on_delete: :cascade}

      t.timestamps
  end
  end
end
