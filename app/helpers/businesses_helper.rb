module BusinessesHelper
  def infowindow_single(b)
    info = ""

    info << "<b>#{b.name}</b>"
    info << "<br />"
    info << b.full_address
    info << "<br />"
    info << "Telephone: #{b.telephone}"

    info
  end

  def infowindow_multiple(b)
    info = ""

    info << "<div class='col-lg-12'>"

    if b.photo.present?
      info << "<div class='col-lg-4'>"
      info << "<image src='#{b.photo_url(:small_thumb)}' />"
      info << "</div>"
    end

    info << "<div class='col-lg-8'>"
    info << "<b><a href='#{public_business_path(b)}'>#{b.name}</a></b>"
    info << "<br />"
    info << "<small>"
    info << "<b>Services</b>: #{b.services.split(',').join(', ')}"
    info << "<br />"
    info << "<b>Address</b>: #{b.full_address}"
    info << "<br />"
    info << "<b>Telephone</b>: #{b.telephone}"
    info << "</small>"
    info << "</div>"
    info << "</div>"

    info
  end
end
