class AddDefaultValueToUpvoteAndDownvote < ActiveRecord::Migration
  def change
    change_column :userarchivments, :upvote, :integer, :default => 0
    change_column :userarchivments, :downvote, :integer, :default => 0
  end
end
