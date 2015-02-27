class RenameCommentToReview < ActiveRecord::Migration
  def change
    rename_table :comments, :reviews
  end
end
