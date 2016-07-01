class Publications::AuthorsController < ApplicationController
  before_filter :require_authentication

  def create
    author = publication.authors.
    find_or_initialize_by(user_id: current_user.id)
    author.update!(author_params)
    head :ok
  end
  
  def update
    create
  end
  
  private
  
  def publication
    @publication ||= Publication.find(params[:publication_id])
  end

  def author_params
    params.require(:author).permit(:points)
  end
end