class RemoveViewsFromVideos < ActiveRecord::Migration[5.2]
  def change
    remove_column :videos, :views, :integer
  end
end
