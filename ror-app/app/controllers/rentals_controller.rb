class RentalsController < ApplicationController
  before_action :set_rental, only: [:show, :edit, :update, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :invalid_rental

  # GET /rentals
  # GET /rentals.json
  def index
    @rentals = Rental.all.paginate(:page => params[:page], :per_page => 5)

    filtering_params(params).each_key do |key|
      @rentals = @rentals.public_send(key).paginate(:page => params[:page], :per_page => 5) if key.present?
    end
  end

  # GET /rentals/1
  # GET /rentals/1.json
  def show
  end

  # GET /rentals/new
  def new
    @rental = Rental.new
    @users = User.all
    @dvd = Dvd.find(params[:dvd_id])
  end

  # GET /rentals/1/edit
  def edit
  end

  # POST /rentals
  # POST /rentals.json
  def create
    @rental = Rental.new(rental_params)
    @dvd = Dvd.find(params[:rental][:dvd_id])

    if params[:rental][:user_id]
      @user_id = params[:rental][:user_id]
    else
      @user_id = 0
    end

    @users = User.all
    respond_to do |format|
      if @rental.save
        format.html { redirect_to [@dvd,@rental], notice: 'Rental was successfully created.' }
        format.json { render :show, status: :created, location: @rental }
      else
        format.html { render :new }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rentals/1
  # PATCH/PUT /rentals/1.json
  def update
    respond_to do |format|
      if @rental.update(rental_params)
        format.html { redirect_to @rental, notice: 'Rental was successfully updated.' }
        format.json { render :show, status: :ok, location: @rental }
      else
        format.html { render :edit }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rentals/1
  # DELETE /rentals/1.json
  def destroy
    @rental.destroy
    respond_to do |format|
      format.html { redirect_to rentals_url, notice: 'Rental was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rental
      @rental = Rental.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rental_params
      params.require(:rental).permit(:dvd_id, :user_id, :rent_date, :return_date, :total_price, :returned, :debtors)
    end

    def invalid_rental
      logger.error "Attempt to access invalid rental #{params[:id]}"
      redirect_to rentals_path, notice: 'Rental not found.'
    end

    def filtering_params(params)
      # Add more params that filter debtors list (if needed)
      params.slice(:debtor)
    end
end
