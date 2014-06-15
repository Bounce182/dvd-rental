class DvdsController < ApplicationController
  before_action :set_dvd, only: [:show, :edit, :update, :destroy]
  before_action :set_genres, :set_languages, only: [:new, :edit]
  before_action :delete_genres, :delete_languages, only: [:update]

  rescue_from ActiveRecord::RecordNotFound, with: :invalid_dvd

  # GET /dvds
  # GET /dvds.json
  def index
    @dvds = Dvd.all.paginate(:page => params[:page], :per_page => 5)
  end

  # GET /dvds/1
  # GET /dvds/1.json
  def show
  end

  # GET /dvds/new
  def new
    @dvd = Dvd.new
  end

  # GET /dvds/1/edit
  def edit
  end

  # POST /dvds
  # POST /dvds.json
  def create
    @dvd = Dvd.new(dvd_params)

    respond_to do |format|
      if @dvd.save
        format.html { redirect_to @dvd, notice: 'Dvd was successfully created.' }
        format.json { render :show, status: :created, location: @dvd }
      else
        format.html { render :new }
        format.json { render json: @dvd.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dvds/1
  # PATCH/PUT /dvds/1.json
  def update

    respond_to do |format|
      if @dvd.update(dvd_params)
        format.html { redirect_to @dvd, notice: 'Dvd was successfully updated.' }
        format.json { render :show, status: :ok, location: @dvd }
      else
        format.html { render :edit }
        format.json { render json: @dvd.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dvds/1
  # DELETE /dvds/1.json
  def destroy
    @dvd.destroy
    respond_to do |format|
      format.html { redirect_to dvds_url, notice: 'Dvd was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    def set_dvd
      if params[:id]
        @dvd = Dvd.find(params[:id])
      else
        @dvd = Dvd.find(params[:dvd][:id])
      end
    end

    def dvd_params
      params.require(:dvd).permit(:title, :description, :year, :length, genre_ids:[], language_ids:[])
    end

    def set_genres
      @genres = Genre.all
    end

    def set_languages
      @languages = Language.all
    end

    def delete_genres
      # Delete all dvd genre relations
      @dvd.genres.delete_all
    end

    def delete_languages
      # Delete all dvd language relations
      @dvd.languages.delete_all
    end

    def invalid_dvd
      logger.error "Attempt to access invalid dvd #{params[:id]}"
      redirect_to dvds_path, notice: 'DVD not found.'
    end

end
