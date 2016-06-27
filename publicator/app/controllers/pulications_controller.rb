class PulicationsController < ApplicationController
  before_action :require_authentication,
    only: [:new, :edit, :create, :update, :destroy]

  def index
    @pulications = Pulication.all
  end

  def show
    @pulications = Pulication.find(params[:id])
  end

  def new
    @pulication = Pulication.new
  end

  def edit
    @pulications = Pulication.find(params[:id])
  end

  def create
    @pulication = Pulication.new(pulication_params)

    respond_to do |format|
      if @pulication.save
        format.html { redirect_to @pulication, notice: 'Pulication was successfully created.' }
      else
        render action: "new"
      end
    end
  end

  def update
    if @pulication.update(room_params)
      redirect_to @pulication, notice: t('flash.notice.room_updated')
    else
      render :edit
    end
  end

  def destroy
    @pulication.destroy
    redirect_to rooms_url
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pulication
      @pulication = Pulication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pulication_params
      params.require(:pulication).permit(:type, :nature, :reach, :authors, :organizer, :vehicle)
    end
end
