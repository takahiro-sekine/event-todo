class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  def index
    @events = Event.all.order(id: 'DESC')
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(events_params)
    if @event.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
    redirect_to action: :index unless current_user.id == @event.user_id
  end

  def update
    if @event.update(event_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @evednt.user_id
      @event.destroy
      redirect_to root_path
    else
      redirect_to action: :index
    end
  end

  private

  def items_params
    params.require(:event).permit(:title, :start_at, :end_at, :body, :image).merge(user_id: current_user.id)
  end

  def set_item
    @event = Event.find(params[:id])
  end
end

