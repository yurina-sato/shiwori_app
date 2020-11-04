class UsersController < ApplicationController
  
  def show # マイページ機能
    @trips = Trip.all
    @my_trips = @trips.joins(:trip_users).distinct.where(trip_users: { user_id: current_user.id }).order('start_day ASC') # 自身が参加しているしおり

  end
end
