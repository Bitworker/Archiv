class Archiv < ActiveRecord::Base
  has_many :userarchivments
  has_many :users, :through => :userarchivments

  validates :name, 
            :presence => {:message => 'Name muss vorhanden sein.'},
            :length => { :within => 1..50, :message => 'Name muss zwischen 1 und 50 zeichen lang sein.'},
            :uniqueness => {:message => 'Name ist schon vorhanden.'}
  
  validates :category,
            :presence => {:message => 'Kategorie muss vergeben sein.'}
  
  validates :points,
            :presence => {:message => 'Punkte muessen vergeben sein.'}
 
end
