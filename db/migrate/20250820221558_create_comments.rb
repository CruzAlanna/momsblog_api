class CreateComments < ActiveRecord::Migration[8.0]
  def change
    create_table :comments do |t|
      t.datetime :time
      t.string :author
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
