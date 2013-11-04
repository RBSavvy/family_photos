class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :phone
      t.string :email
      t.string :crypted_password
      t.string :password_salt

      t.timestamps
    end
  end
end
