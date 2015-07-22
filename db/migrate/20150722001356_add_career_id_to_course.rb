class AddCareerIdToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :career_id, :integer
  end
end
