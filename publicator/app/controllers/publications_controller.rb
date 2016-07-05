class PublicationsController < ApplicationController
  before_action :require_authentication,
    only: [:new, :edit, :create, :update, :destroy]

  def index
    @search_query = params[:q]

    publications = Publication.search(@search_query)    
    @publications = publications.most_recent
  end

  def show
    @publication = Publication.find(params[:id])

    if user_signed_in?
      @user_author = @publication.authors.find_or_initialize_by(user_id: current_user.id)
    end
  end

  def new
    @publication = current_user.publications.build
    @publication.authors.build
  end

  def edit
    @publication = current_user.publications.find(params[:id])
  end

  def create
    @publication = current_user.publications.build(publication_params)

    if @publication.save
      redirect_to @publication, notice: "Publication created"
    else
      render :new
   end
  end

  def update
    @publication = current_user.publications.find(params[:id])

    if @publication.update(publication_params)
      redirect_to @publication, notice: "Publication updated"
    else
      render :edit
    end
  end

  def destroy
    @publication = current_user.publications.find(params[:id])
    @publication.destroy

    redirect_to publications_url
  end

  private

  def set_publication
    @publication = Publication.find(params[:id])
  end

  def publication_params
    params.require(:publication).permit(:title, :subtitle, :edition, :local,
      :publishing_company, :year_of_publication, :description, :other,
        :category, :volume, :publication_number, :initial_final_page, :section,
        authors_attributes: [:id, :name, :surname])
  end
end
