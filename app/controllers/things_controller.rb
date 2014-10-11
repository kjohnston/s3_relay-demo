class ThingsController < ApplicationController

  def index
    @things = Thing.all.order("created_at DESC")
  end

  def new
    @thing = Thing.new
    render "form"
  end

  def create
    @thing = Thing.new(thing_params)
    # @thing.new_photo_uploads_uuids = params[:thing][:new_photo_uploads_uuids]

    if @thing.save
      redirect_to thing_path(@thing)
    else
      render "form"
    end
  end

  def show
    @thing = Thing.find(params[:id])
  end

  private

  def thing_params
    params.require(:thing).permit(:name, new_photo_uploads_uuids: [])
  end

end
