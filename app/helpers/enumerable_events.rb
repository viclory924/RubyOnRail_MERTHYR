class EnumerableEvents
  include Enumerable

  def initialize(events)
    @events = events
  end

  def each(*)
    @events.each do |events|
      events[1].each do |e|
        if e.repeat != 'Never'
          ical = e.to_ical
          (ical.previous_occurrences(5, Time.now.utc) + ical.next_occurrences(5, 1.minute.from_now.utc))
              .each { |occurrence| yield copy_event(e, occurrence) }
        else
          yield e
        end
      end
    end
  end

  private

  def copy_event(e, occurrence)
    scheduler = e.dup
    scheduler.repeat = 'Never'
    scheduler.next_occurrence = occurrence
    scheduler.id = e.id
    scheduler
  end
end