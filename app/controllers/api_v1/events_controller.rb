class ApiV1::EventsController < ApplicationController

  def index
    @events = Event.page(params[:page])
  end

  def show
    @event = Event.find(params[:id])
  end

end
