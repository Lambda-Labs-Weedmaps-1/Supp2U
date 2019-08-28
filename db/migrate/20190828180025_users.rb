class Users < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, index: {unique: true}
      t.string :email, index: {unique: true}
      t.string :wallet
      t.boolean :is_admin, default: false

      t.timestamps
    end
  end
end
