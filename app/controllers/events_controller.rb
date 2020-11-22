class EventsController < ApplicationController
  before_action :set_trip
  before_action :set_schedule
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :move_to_root

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to trip_schedule_path(@trip.id, @schedule.id), notice: 'イベントを作成しました。'
    else
      @event.images = nil # 画像プレビューを空にする
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to trip_schedule_event_path(@trip.id, @schedule.id, @event.id), notice: 'イベントを編集しました。'
    else
      @event.images = nil # 画像プレビューを空にする(DB自体はそのまま)
      render :edit
    end
  end

  def destroy
    if @event.destroy
      redirect_to trip_schedule_path(@trip.id, @schedule.id), notice: 'イベントを削除しました。'
    else
      flash.now[:alart] = '削除できないイベントです。'
      redirect_to trip_schedule_path(@trip.id, @schedule.id)
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :text, :day, :start_time, :finish_time, :place, :url, :price, images: []).merge(schedule_id: params[:schedule_id])
  end

  def set_trip
    @trip = Trip.includes(trip_users: :user, schedules: :events).find(params[:trip_id]) # N+1問題対策
  end

  def set_schedule
    @schedule = Schedule.includes(:events).find(params[:schedule_id]) # N+1問題対策
  end

  def set_event
    @event = Event.with_attached_images.find(params[:id]) # N+1問題対策
  end

  def move_to_root
    redirect_to root_path unless user_signed_in? && @trip.user_ids.include?(current_user.id)
  end
end
