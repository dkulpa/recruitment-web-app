class RenameTypeToInterestType < ActiveRecord::Migration[5.0]
  def change
    rename_column :interests, :type, :interest_type
  end
end
