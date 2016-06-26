class HomeController < ApplicationController
  def index
    @pulication = Pulication.take(3)
  end
end
