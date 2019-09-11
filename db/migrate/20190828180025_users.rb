class Users < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, index: {unique: true}
      t.string :email, index: {unique: true}
      t.string :password, index: {unique: true}
      t.string :wallet
      t.boolean :is_admin, default: false
      t.string :stripe_token,
      t.string :stripe_email

      t.timestamps
    end
  end
end
