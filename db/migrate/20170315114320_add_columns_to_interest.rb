class AddColumnsToInterest < ActiveRecord::Migration[5.0]
  def change
    add_column :interests, :name, :string
    add_column :interests, :type, :string
  end
end
