class PublicationsController < ApplicationController
  before_action :require_authentication,
    only: [:new, :edit, :create, :update, :destroy]

    def index
    @publications = Publication.all
  end

  def show
    @publication = Publication.find(params[:id])
  end

  def new
    @publication = Publication.new
  end

  def edit
    @publication = Publication.find(params[:id])
  end

  def create
    @publication = Publication.new(publication_params)
  
    if @publication.save
      redirect_to @publication, notice: "Publicação criada com sucesso"
    else
      render :new
   end
  end

  def update
    if @publication.update(publication_params)
      redirect_to @publication, notice: "Atualizado com sucesso"
    else
      render :edit
    end
  end

  def destroy
    @publication = Publication.find(params[:id])
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
        :category, :volume, :publication_number, :initial_final_page, :section)
  end
end
