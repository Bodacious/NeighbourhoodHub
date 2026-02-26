class CreateIdentificationUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :identification_users do |t|
      t.string :email, null: false, default: ""
      t.string :name, null: false, default: ""
      t.string :password_digest, null: false, default: ""

      t.timestamps
    end
  end
end
