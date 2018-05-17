class StaticPagesController < ApplicationController
  def home
     @dog = current_user.dogs.build if logged_in?
  end

  def help
  end
end
