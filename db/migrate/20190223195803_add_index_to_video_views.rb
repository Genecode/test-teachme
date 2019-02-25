class AddIndexToVideoViews < ActiveRecord::Migration[5.2]
  def change
    add_index :video_views, :customer_id
    add_index :video_views, :video_id
    add_index :video_views, :created_at
  end
end
