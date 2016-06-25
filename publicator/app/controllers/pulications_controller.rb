class PulicationsController < ApplicationController
  before_action :set_pulication, only: [:show, :edit, :update, :destroy]

  # GET /pulications
  # GET /pulications.json
  def index
    @pulications = Pulication.all
  end

  # GET /pulications/1
  # GET /pulications/1.json
  def show
  end

  # GET /pulications/new
  def new
    @pulication = Pulication.new
  end

  # GET /pulications/1/edit
  def edit
  end

  # POST /pulications
  # POST /pulications.json
  def create
    @pulication = Pulication.new(pulication_params)

    respond_to do |format|
      if @pulication.save
        format.html { redirect_to @pulication, notice: 'Pulication was successfully created.' }
        format.json { render :show, status: :created, location: @pulication }
      else
        format.html { render :new }
        format.json { render json: @pulication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pulications/1
  # PATCH/PUT /pulications/1.json
  def update
    respond_to do |format|
      if @pulication.update(pulication_params)
        format.html { redirect_to @pulication, notice: 'Pulication was successfully updated.' }
        format.json { render :show, status: :ok, location: @pulication }
      else
        format.html { render :edit }
        format.json { render json: @pulication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pulications/1
  # DELETE /pulications/1.json
  def destroy
    @pulication.destroy
    respond_to do |format|
      format.html { redirect_to pulications_url, notice: 'Pulication was successfully destroyed.' }
      format.json { head :no_content }
    end
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
