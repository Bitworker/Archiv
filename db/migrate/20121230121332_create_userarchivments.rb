class CreateUserarchivments < ActiveRecord::Migration
  def change
    create_table :userarchivments do |t|
      t.integer :user_id
      t.integer :archiv_id
      t.integer :upvote
      t.integer :downvote

      t.timestamps
    end
  end
end
