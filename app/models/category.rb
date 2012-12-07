class Category < ActiveRecord::Base


  validates :name, 
            :presence => {:message => 'Name muss vorhanden sein.'},
            :length => { :within => 1..50, :message => 'Name muss zwischen 1 und 50 zeichen lang sein.'},
            :uniqueness => {:message => 'Name ist schon vorhanden.'}
  
end
