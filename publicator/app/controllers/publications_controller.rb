class PublicationsController < ApplicationController
  before_action :require_authentication,
    only: [:new, :edit, :create, :update, :destroy]

    def index
    @publications = Publication.all
  end

  def show
    @publications = Publication.find(params[:id])
  end

  def new
    @publication = Publication.new
  end

  def edit
    @publications = Publication.find(params[:id])
  end

  def create
    @publication = Publication.new(params[:room])
  
    if @publication.save
      redirect_to @publication, notice: t('flash.notice.room_created')
    else
      render action: "new"
   end
  end

  def update
    @publication = Publication.find(params[:id])

    if @publication.update(params[:room])
      redirect_to @publication, notice: t('flash.notice.room_updated')
    else
      render action: "edit"
    end
  end

  def destroy
    @publication = Publication.find(params[:id])
    @publication.destroy

    redirect_to rooms_url
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
