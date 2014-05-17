class WebinarsController < ApplicationController
  before_action :set_webinar, only: [:show, :edit, :update, :destroy]

  # GET /webinars
  # GET /webinars.json
  def index
    @webinars = Webinar.all
  end

  # GET /webinars/1
  # GET /webinars/1.json
  def show
  end

  # GET /webinars/new
  def new
    @webinar = Webinar.new
  end

  # GET /webinars/1/edit
  def edit
  end

  # POST /webinars
  # POST /webinars.json
  def create
    @webinar = Webinar.new(webinar_params)

    respond_to do |format|
      if @webinar.save
        format.html { redirect_to @webinar, notice: 'Webinar was successfully created.' }
        format.json { render action: 'show', status: :created, location: @webinar }
      else
        format.html { render action: 'new' }
        format.json { render json: @webinar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /webinars/1
  # PATCH/PUT /webinars/1.json
  def update
    respond_to do |format|
      if @webinar.update(webinar_params)
        format.html { redirect_to @webinar, notice: 'Webinar was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @webinar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /webinars/1
  # DELETE /webinars/1.json
  def destroy
    @webinar.destroy
    respond_to do |format|
      format.html { redirect_to webinars_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_webinar
      @webinar = Webinar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def webinar_params
      params.require(:webinar).permit(:date, :subject, :detail, :presenter, :info, :url)
    end
end
