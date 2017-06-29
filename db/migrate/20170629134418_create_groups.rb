class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.references :recipe, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
