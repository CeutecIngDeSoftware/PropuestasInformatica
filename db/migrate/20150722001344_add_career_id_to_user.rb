class AddCareerIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :career_id, :integer
  end
end
