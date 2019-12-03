class EventUpdateOccurrenceWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  # recurrence do
  #   hourly(1)
  # end

  sidekiq_options queue: :event_update_occurrence_queue, retry: 2, backtrace: true

  def perform
    schedulers = Event.upcoming_ongoing
    schedulers.each do |scheduler|
      scheduler.update_next_occurrence.save!
    end
  end
end