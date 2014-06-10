class RentalsController < ApplicationController
  before_action :set_user_dvd, only: [:show, :edit, :update, :destroy]

  # GET /rentals
  # GET /rentals.json
  def index
    @user_dvds = Rental.all
  end

  # GET /rentals/1
  # GET /rentals/1.json
  def show
  end

  # GET /rentals/new
  def new
    @user_dvd = Rental.new
  end

  # GET /rentals/1/edit
  def edit
  end

  # POST /rentals
  # POST /rentals.json
  def create
    @user_dvd = Rental.new(user_dvd_params)

    respond_to do |format|
      if @user_dvd.save
        format.html { redirect_to @user_dvd, notice: 'User dvd was successfully created.' }
        format.json { render :show, status: :created, location: @user_dvd }
      else
        format.html { render :new }
        format.json { render json: @user_dvd.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rentals/1
  # PATCH/PUT /rentals/1.json
  def update
    respond_to do |format|
      if @user_dvd.update(user_dvd_params)
        format.html { redirect_to @user_dvd, notice: 'User dvd was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_dvd }
      else
        format.html { render :edit }
        format.json { render json: @user_dvd.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rentals/1
  # DELETE /rentals/1.json
  def destroy
    @user_dvd.destroy
    respond_to do |format|
      format.html { redirect_to user_dvds_url, notice: 'User dvd was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_dvd
      @user_dvd = Rental.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_dvd_params
      params.require(:user_dvd).permit(:dvd_id, :user_id, :rent_date, :return_date, :total_price, :returned)
    end
end
