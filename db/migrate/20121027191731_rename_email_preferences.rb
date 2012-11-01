class RenameEmailPreferences < ActiveRecord::Migration
  def change
    remove_column :email_preferences, :email_type
    remove_column :email_preferences, :setting_value
    rename_table :email_preferences, :preferences

    add_column :preferences, :properties, :string
  end
end
