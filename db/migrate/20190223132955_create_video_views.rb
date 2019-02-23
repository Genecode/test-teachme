class CreateVideoViews < ActiveRecord::Migration[5.2]
  def change
    create_table :video_views do |t|
      t.integer :video_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
