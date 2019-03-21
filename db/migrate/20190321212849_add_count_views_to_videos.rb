class AddCountViewsToVideos < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :count_views, :integer, default: 0
  end
end
