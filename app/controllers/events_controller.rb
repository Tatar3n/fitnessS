class EventsController < ApplicationController
  def index
    @current_events = Event.current_events
    @upcoming_events = Event.upcoming_events
    @past_events = Event.past_events
  end
  def new
    @event = Event.new
    @event.competitions.build
  end
  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event, notice: "Событие успешно создано."
    else
      render :new
    end
  end
  def show
    @event = Event.find(params[:id])
  end
  def edit
  end
  def update
  end
  def destroy
  end
  def event_params
    params.require(:event).permit(:title, :place, :starts_at, :ends_at,
                                  competitions_attributes: [ :id, :name,
                                                             :min_athlete_weight, :max_athlete_weight,
                                                             :starts_at, :ends_at ])
  end
end
