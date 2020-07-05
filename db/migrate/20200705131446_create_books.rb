class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title, null:false
      t.text :body, null:false, limit:200
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
