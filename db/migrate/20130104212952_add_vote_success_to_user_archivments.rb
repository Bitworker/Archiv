class AddVoteSuccessToUserArchivments < ActiveRecord::Migration
  def change
    change_table :userarchivments do |t|
      t.boolean :vote_success, :default => false, :after => "downvote"
    end
  end
end
