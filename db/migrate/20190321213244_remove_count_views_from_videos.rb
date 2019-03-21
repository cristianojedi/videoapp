class RemoveCountViewsFromVideos < ActiveRecord::Migration[5.2]
  def change
    remove_column :videos, :count_views, :integer
  end
end
