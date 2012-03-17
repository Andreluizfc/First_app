class HomeController < ApplicationController
  
  before_filter :auth, :except => []
  def index
  end

end
