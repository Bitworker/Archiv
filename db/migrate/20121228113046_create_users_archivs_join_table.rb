class CreateUsersArchivsJoinTable < ActiveRecord::Migration
  def up
    create_table :archivs_users, :id => false do |t|
      t.integer :user_id
      t.integer :archiv_id
    end
  end

  def down
  	drop_table :archivs_users
  end
end
