class HomeController < ApplicationController
  def index
    @member = current_user
  end
end
