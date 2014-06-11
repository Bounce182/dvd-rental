class DvdsController < ApplicationController
  before_action :set_dvd, only: [:show, :edit, :update, :destroy]
  before_action :delete_genres, :delete_languages, only: [:update]
  after_action :add_genres, :add_languages, only: [:create, :update]

  # GET /dvds
  # GET /dvds.json
  def index
    @dvds = Dvd.all
  end

  # GET /dvds/1
  # GET /dvds/1.json
  def show
  end

  # GET /dvds/new
  def new
    @dvd = Dvd.new
    @genres = Genre.all
    @languages = Language.all
  end

  # GET /dvds/1/edit
  def edit
    @genres = Genre.all
    @languages = Language.all
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
      @dvd = Dvd.find(params[:id])
    end

    def dvd_params
      params.require(:dvd).permit(:title, :description, :year, :length)
    end

    def add_languages
      params[:dvd][:languages].each do |l|
        if !l.empty?
          @dvd.languages << Language.find(l)
        end
      end
    end

    def add_genres
      params[:dvd][:genres].each do |g|
        if !g.empty?
          @dvd.genres << Genre.find(g)
        end
      end
    end

    def delete_genres
      # Delete all dvd genre relations
      @dvd.genres.delete_all
    end

    def delete_languages
      # Delete all dvd language relations
      @dvd.languages.delete_all
    end

end
