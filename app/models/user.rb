class User < ActiveRecord::Base
  has_many :authentications, :dependent => :delete_all
  has_many :userarchivments
  has_many :archivs, :through => :userarchivments

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  def apply_omniauth(auth)
    # In previous omniauth, 'user_info' was used in place of 'raw_info'
    self.email = auth['extra']['raw_info']['email']
    self.first_name = auth['extra']['raw_info']['first_name']
    self.last_name = auth['extra']['raw_info']['last_name']
    self.username = auth['extra']['raw_info']['username']
    # Again, saving token is optional. If you haven't created the column in authentications table, this will fail
    authentications.build(:provider => auth['provider'], :uid => auth['uid'], :token => auth['credentials']['token'])
  end

end
