class HomeController < ApplicationController
  def index
    @publication = Publication.last(5)
  end
end
