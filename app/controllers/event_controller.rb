class EventController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]

  def index
    @event = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(title: params[:title], description: params[:description], duration: params[:duration], start_date: params[:start_date], price: params[:price], location: params[:location], organizer_id: current_user.id)

    if @event.save
      redirect_to event_path(@event.id)
    end
  end

  def show
    @event = Event.find(params[:id])
  end
end
