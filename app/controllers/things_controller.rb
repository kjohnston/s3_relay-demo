class ThingsController < ApplicationController

  def index
    @things = Thing.all.order("created_at DESC")
  end

  def show
    @thing = Thing.find(params[:id])
  end

end
