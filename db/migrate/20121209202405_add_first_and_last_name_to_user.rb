class AddFirstAndLastNameToUser < ActiveRecord::Migration
  def change
  	change_table :users do |t|
      t.string :first_name, :after => "email"
      t.string :last_name, :after => "first_name"
      t.string :username, :after => "last_name"
    end
  end
end
