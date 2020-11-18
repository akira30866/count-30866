class CreateDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :details do |t|

      t.timestamps
      t.string     :title
      t.integer    :number
      t.integer    :probability
      t.references :count, foreign_key: true
    end
  end
end
