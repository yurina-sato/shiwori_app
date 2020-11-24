class ItemsController < ApplicationController
  before_action :set_trip
  before_action :set_list
  before_action :set_item, only: [:edit, :update, :destroy]
  before_action :move_to_root

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to trip_list_path(@trip.id, @list.id), notice: 'リスト項目を追加しました。'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to trip_list_path(@trip.id, @list.id), notice: 'リスト項目を編集しました。'
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to trip_list_path(@trip.id, @list.id), notice: 'リスト項目を削除しました。'
    else
      flash.now[:alart] = '削除できないリスト項目です。'
      redirect_to trip_list_path(@trip.id, @list.id)
    end
  end

  def checked
    @item = Item.find(params[:id])
    if @item.checked
      @item.update(checked: false)
    else
      @item.update(checked: true)
    end

    checked_item = Item.find(params[:id])
    render json: { item: checked_item }
  end

  private

  def item_params
    params.require(:item).permit(:name, :text).merge(list_id: params[:list_id])
  end

  def set_trip
    @trip = Trip.includes(lists: :items).find(params[:trip_id]) # N+1問題対策
  end

  def set_list
    @list = List.includes(:items).find(params[:list_id]) # N+1問題対策
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_root
    redirect_to root_path unless user_signed_in? && @trip.user_ids.include?(current_user.id)
  end
end
