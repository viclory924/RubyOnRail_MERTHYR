module EventsHelper
  def event_infowindow(e)
    info = ""

    info << "<b>#{e.name}</b>"
    info << "<br />"
    info << "#{e.location_name} - #{e.location_address}"

    info
  end

  def render_date(event)
    if event.starts.to_date == event.ends.to_date
      start_day = event.starts.strftime("%B #{event.starts.day.ordinalize}, %-I:%M%P")
      end_day = event.ends.strftime("%-I:%M%P")
      "#{start_day} - #{end_day}"
    else
      start_day = event.next_occurrence.strftime("%B #{event.next_occurrence.day.ordinalize}, %-I:%M%P")
      end_date = (start_day.to_time + event.duration).to_datetime
      end_day = end_date.strftime("%B #{end_date.day.ordinalize}, %-I:%M%P")
      "#{start_day} until #{end_day}"
    end
  end
end
