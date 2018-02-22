class Employer < ActiveRecord::Migration[5.1]
  def change
      create_table :employers do |t|
        t.string :company_name
        t.string :street_address
        t.string :city
        t.string :state
        t.string :email
        t.string :password_digest
      end
  end
end
