class CreateCounts < ActiveRecord::Migration[6.0]
  def change
    create_table :counts do |t|

      t.timestamps
      t.string    :name, null: false
      t.string    :remark
      t.integer   :category_id, null: false
      t.integer   :release_id, null: false
      t.integer   :trials
      t.references :user, foreign_key: true
    end
  end
end
