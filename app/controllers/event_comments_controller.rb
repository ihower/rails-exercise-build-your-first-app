class EventCommentsController < ApplicationController

  before_action :find_event

  def index
    @comments = @event.comments
  end

  def show
    @comment = @event.comments.find( params[:id] )
  end

  def new
    @comment = @event.comments.build
  end

  def create
    @comment = @event.comments.build( comment_params )
    if @comment.save
      redirect_to event_comments_url( @event )
    else
      render :action => :new
    end
  end

  def edit
    @comment = @event.comments.find( params[:id] )
  end

  def update
    @comment = @event.comments.find( params[:id] )

    if @comment.update( comment_params )
      redirect_to event_comments_url( @event )
    else
      render :action => :edit
    end

  end

  def destroy
    @comment = @event.comments.find( params[:id] )
    @comment.destroy

    redirect_to event_comments_url( @event )
  end

  protected

  def find_event
    @event = Event.find( params[:event_id] )
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end
