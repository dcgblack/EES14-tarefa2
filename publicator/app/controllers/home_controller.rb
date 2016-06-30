class HomeController < ApplicationController
  def index
    @publication = Publication.take(3)
  end
end
