class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip
      t.text :summary
      t.text :skills
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
