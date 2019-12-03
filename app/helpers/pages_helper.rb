module PagesHelper
  def business_opening_closing_hours(business, day)
    opening = business.send("#{day}_opening")
    closing = business.send("#{day}_closing")
    if opening.present? && closing.present?
      "#{opening} - #{closing}"
    elsif opening == 'closed' || closing == 'closed'
      'Closed'
    else
      'Please contact for opening times'
    end
  end

  def event_on(event)
    if @event.starts.to_date == @event.ends.to_date
      "#{@event.starts.strftime("%B #{@event.starts.day.ordinalize}, %-I:%M%P")} - #{@event.ends.strftime("%-I:%M%P")}"
    else
      "#{@event.starts.strftime("%B #{@event.starts.day.ordinalize}, %-I:%M%P")} until #{@event.ends.strftime("%B #{@event.starts.day.ordinalize}, %-I:%M%P")}"
    end
  end
end
