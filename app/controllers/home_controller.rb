class HomeController < ApplicationController
  def index
    @membro = current_user
  end
end