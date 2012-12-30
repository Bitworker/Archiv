class Userarchivment < ActiveRecord::Base
  belongs_to :user
  belongs_to :archiv
end
