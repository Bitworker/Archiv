class AddTokenToAuthentications < ActiveRecord::Migration
  def change
    change_table :authentications do |t|
      t.string :token, :after => "uid"
    end
  end
end
