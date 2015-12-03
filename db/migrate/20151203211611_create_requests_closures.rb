class CreateRequestsClosures < ActiveRecord::Migration
  def change
    create_table :requests_closures do |t|
      t.integer :career_id
      t.date :final_date

      t.timestamps
    end
  end
end
