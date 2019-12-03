require 'open-uri'

class DealPdf < Prawn::Document
  def initialize(deal, view_context)
    super top_margin: 30

    @deal = deal
    @view = view_context

    doc_header
    deal_content
    doc_footer
  end

  def doc_header
    image "#{Rails.root}/public/assets/img/logo.png", width: 100
    #text 'WeLoveMerthyr', align: :left
    move_up 12
    text "#{@deal.business_name} voucher", align: :right
    stroke_horizontal_rule
  end

  def deal_content
    move_down 40
    text @deal.title, size: 30, style: :bold
    text "At #{@deal.business_name}, #{@deal.business.full_address}"
    move_down 5
    text @deal.start_date.strftime("%B #{@deal.start_date.day.ordinalize}, %Y")

    move_down 30

    y_position = cursor

    bounding_box [0, y_position], width: 300, height: 530 do
      desc = @deal.description.html_safe
      desc.gsub!('<p>', '')
      desc.gsub!('</p>', '')
      text desc

      move_down 20
      text 'Terms and Conditions', size: 20, style: :bold
      text @deal.terms
    end

    bounding_box [310, y_position], width: 300, height: 500 do
      if Rails.env.development?
        #image "#{Rails.root}/public#{@deal.image_url(:thumb)}", width: 240#, height: info['height']
      elsif Rails.env.production?
        image open(@deal.image_url(:thumb)), width: 240#, width: 364, height: info['height']
      end
    end
  end

  def doc_footer
    stroke_horizontal_rule
    move_down 10
    text @view.public_voucher_url(@deal), align: :left
    move_up 14
    text Time.now.strftime("%B #{Time.now.day.ordinalize}, %Y"), align: :right
  end
end
