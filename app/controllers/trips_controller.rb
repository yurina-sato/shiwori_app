class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]
  before_action :move_to_root, only: [:edit, :update, :destroy]


  def show
    @trip = Trip.find(params[:id])
    @schedules = @trip.schedules.order('day ASC')
    @lists = @trip.lists.order('created_at DESC')

    @trip_cost = 0
    @schedules.each do |schedule|
      day_cost = 0 # イベント毎の金額を合計し、一日毎(スケジュール毎)の金額を取得
      schedule.events.each do |event| 
        if event.price != nil
          cost = event.price
          day_cost = day_cost + cost
        end
      end
      @trip_cost = @trip_cost + day_cost # スケジュール毎の金額を合計し、旅行全体の金額に
    end

  end

  def new
    @trip = Trip.new

  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      redirect_to root_path, notice: 'しおりを作成しました。'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @trip.update(trip_params)
      redirect_to trip_path(@trip.id), notice: 'しおりを更新しました。'
    else
      render :edit
    end
  end

  def destroy
    if @trip.destroy
      redirect_to root_path, notice: 'しおりを削除しました。'
    else
      flash.now[:alart] = '削除できないしおりです。'
      redirect_to root_path
    end
  end

  private
  def trip_params
    params.require(:trip).permit(:name, :text, :destination, :start_day, :finish_day, user_ids:[])
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def move_to_root
    redirect_to root_path unless user_signed_in? && @trip.user_ids.include?(current_user.id)
  end

end
