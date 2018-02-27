class CreateMentorships < ActiveRecord::Migration[5.1]
  def change
    create_table :mentorships do |t|
      t.integer :user_id
      t.integer :mentor_id
    end
  end
end
