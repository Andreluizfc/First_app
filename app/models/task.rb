class Task < ActiveRecord::Base
  validates :name, :presence => true, 
                   :length => { :maximum => 40 }, 
                   :format => { :with => /^[a-zA-Z\s]*$/ }

  validates :status, :format => { :with => /^[a-zA-Z\s]*$/ }

end
