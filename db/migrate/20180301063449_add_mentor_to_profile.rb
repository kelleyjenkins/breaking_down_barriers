class AddMentorToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :mentor, :integer, default: 0
  end
end
