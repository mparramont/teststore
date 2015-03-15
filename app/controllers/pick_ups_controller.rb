class PickUpsController < ApplicationController
  before_action :set_pick_up, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /pick_ups
  # GET /pick_ups.json
  def index
    @pick_ups = PickUp.where(user: current_user)
  end

  # GET /pick_ups/1
  # GET /pick_ups/1.json
  def show
  end

  # GET /pick_ups/new
  def new
    @pick_up = PickUp.new(user: current_user)
  end

  # GET /pick_ups/1/edit
  def edit
  end

  # POST /pick_ups
  # POST /pick_ups.json
  def create
    @pick_up = PickUp.new(pick_up_params.merge!(user: current_user))

    respond_to do |format|
      if @pick_up.save
        format.html { redirect_to @pick_up, notice: 'Pick up was successfully created.' }
        format.json { render :show, status: :created, location: @pick_up }
      else
        format.html { render :new }
        format.json { render json: @pick_up.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pick_ups/1
  # PATCH/PUT /pick_ups/1.json
  def update
    respond_to do |format|
      if @pick_up.update(pick_up_params)
        format.html { redirect_to @pick_up, notice: 'Pick up was successfully updated.' }
        format.json { render :show, status: :ok, location: @pick_up }
      else
        format.html { render :edit }
        format.json { render json: @pick_up.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pick_ups/1
  # DELETE /pick_ups/1.json
  def destroy
    @pick_up.destroy
    respond_to do |format|
      format.html { redirect_to pick_ups_url, notice: 'Pick up was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pick_up
      @pick_up = PickUp.where(user: current_user).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pick_up_params
      params.require(:pick_up).permit(:time)
    end
end
