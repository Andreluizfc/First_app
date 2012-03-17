class Task < ActiveRecord::Base
	validates :name, :presence => true, 
                  :length => { :maximum => 20 }

end
