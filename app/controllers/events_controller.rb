class EventsController < ApplicationController
  def index
    @events = Events.all
  end
  def upcoming_competitions
    current_date = DateTime.now
    events = Event.all.where("starts_at > ?", current_date)
  end
  def new
    @event = Event.new
  end
  def create
  end
  def show
  end
  def edit
  end
  def update
  end
  def destroy
  end
end
