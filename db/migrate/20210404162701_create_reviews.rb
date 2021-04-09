class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :context
      t.integer :rating
      t.references :user, null: false, foreign_key: {on_delete: :cascade}
      t.references :strain, null: false, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
