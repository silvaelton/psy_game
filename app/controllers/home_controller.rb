class HomeController < ApplicationController

  def index
    session[:step]      = 1
    session[:group_id]  = nil
    session[:user_id]   = nil
  end

end