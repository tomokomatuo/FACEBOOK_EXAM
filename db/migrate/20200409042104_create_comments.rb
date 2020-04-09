class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content
      t.text :image
      t.references :user, foreign_key: true
    end
  end
end
