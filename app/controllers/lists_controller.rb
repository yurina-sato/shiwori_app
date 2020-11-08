class ListsController < ApplicationController
  before_action :set_trip
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  before_action :move_to_root


  def show
    @list = List.find(params[:id])
    @items = @list.items.order('created_at ASC')
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to trip_path(@trip.id), notice: 'リストページを作成しました。'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to trip_list_path(@trip.id, @list.id), notice: 'リストページを更新しました。'
    else
      render :edit
    end
  end

  def destroy
    if @list.destroy
      redirect_to trip_path(@trip.id), notice: 'リストページを削除しました。'
    else
      flash.now[:alart] = '削除できないリストページです。'
      redirect_to trip_path(@trip.id)
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :text).merge(trip_id: params[:trip_id])
  end

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def set_list
    @list = List.find(params[:id])
  end

  def move_to_root
    redirect_to root_path unless user_signed_in? && @trip.user_ids.include?(current_user.id)
  end

end
