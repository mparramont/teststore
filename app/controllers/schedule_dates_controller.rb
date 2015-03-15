class ScheduleDatesController < ApplicationController
  before_action :set_schedule_date, only: [:show, :edit, :update, :destroy]

  # GET /schedule_dates
  # GET /schedule_dates.json
  def index
    @schedule_dates = ScheduleDate.all
  end

  # GET /schedule_dates/1
  # GET /schedule_dates/1.json
  def show
  end

  # GET /schedule_dates/new
  def new
    @schedule_date = ScheduleDate.new(user: current_user, type: params[:type])
  end

  # GET /schedule_dates/1/edit
  def edit
  end

  # POST /schedule_dates
  # POST /schedule_dates.json
  def create
    debugger
    @schedule_date = ScheduleDate.new(
      schedule_date_params.merge!(user: current_user)
    )

    respond_to do |format|
      if @schedule_date.save
        format.html { redirect_to @schedule_date, notice: 'Schedule date was successfully created.' }
        format.json { render :show, status: :created, location: @schedule_date }
      else
        format.html { render :new }
        format.json { render json: @schedule_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedule_dates/1
  # PATCH/PUT /schedule_dates/1.json
  def update
    respond_to do |format|
      if @schedule_date.update(schedule_date_params)
        format.html { redirect_to @schedule_date, notice: 'Schedule date was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule_date }
      else
        format.html { render :edit }
        format.json { render json: @schedule_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedule_dates/1
  # DELETE /schedule_dates/1.json
  def destroy
    @schedule_date.destroy
    respond_to do |format|
      format.html { redirect_to schedule_dates_url, notice: 'Schedule date was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule_date
      @schedule_date = ScheduleDate.find_by(id: params[:id],
                                            user: current_user,
                                            type: params[:type])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_date_params
      params.require(:schedule_date).permit(:time, :user_id, :type)
    end
end
