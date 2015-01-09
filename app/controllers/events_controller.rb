class EventsController < ApplicationController

  before_action :set_event, :only => [ :show, :edit, :update, :destroy]

  def index
    if params[:keyword]
      @events = Event.where( [ "name like ?", "%#{params[:keyword]}%" ]).page(params[:page]).per(5)
    else
      @events = Event.page(params[:page]).per(5)
    end

    sort_by = (params[:order] == 'name') ? 'name' : 'id DESC'
    @events = @events.order(sort_by)

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @events.to_xml }
      format.json { render :json => @events.to_json }
    end
  end

  def show
    @page_title = @event.name
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      flash[:notice] = "event was successfully created"
      redirect_to :action => :index
    else
      render :action => :new
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      flash[:notice] = "event was successfully updated"
      redirect_to :action => :show, :id => @event
    else
      render :action => :edit
    end
  end

  def destroy
    @event.destroy

    flash[:alert] = "event was successfully deleted"

    redirect_to :action => :index
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :category_id, :group_ids => [])
  end

end
