class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.boolean :isAdmin
      t.integer :age
      t.string :img_url
      t.string :belt

      t.timestamps
    end
  end
end
