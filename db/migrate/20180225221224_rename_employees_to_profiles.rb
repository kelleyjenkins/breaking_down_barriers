class RenameEmployeesToProfiles < ActiveRecord::Migration[5.1]
  def change
    rename_table :employees, :profiles
  end
end
