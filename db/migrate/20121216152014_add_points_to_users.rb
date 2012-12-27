class AddPointsToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :points, :after => "username"
    end
  end
end
