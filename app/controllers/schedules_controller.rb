class SchedulesController < ApplicationController
  before_action :set_trip
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]
  before_action :move_to_root

  def show
    @events = @schedule.events.with_attached_images.order('start_time ASC') # N+1問題対策(images)

    @day_cost = 0 # イベント毎の金額をけ合計し、一日毎(スケジュールページ)の金額を表示
    @events.each do |event|
      unless event.price.nil?
        cost = event.price
        @day_cost += cost
      end
    end
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to trip_path(@trip.id), notice: 'スケジュールページを作成しました。'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @schedule.update(schedule_params)
      redirect_to trip_schedule_path(@trip.id, @schedule.id), notice: 'スケジュールページを更新しました。'
    else
      render :edit
    end
  end

  def destroy
    if @schedule.destroy
      redirect_to trip_path(@trip.id), notice: 'スケジュールページを削除しました。'
    else
      flash.now[:alart] = '削除できないスケジュールページです。'
      redirect_to trip_path(@trip.id)
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:name, :text, :day).merge(trip_id: params[:trip_id])
  end

  def set_trip
    @trip = Trip.includes(trip_users: :user, schedules: :events).find(params[:trip_id]) # N+1問題対策
  end

  def set_schedule
    @schedule = Schedule.includes(:events).find(params[:id]) # N+1問題対策
  end

  def move_to_root
    redirect_to root_path unless user_signed_in? && @trip.user_ids.include?(current_user.id)
  end
end
