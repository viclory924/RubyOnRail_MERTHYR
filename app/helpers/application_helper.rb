module ApplicationHelper
  def flash_messages
    flash.map do |key, msg|
      content_tag :div, 
        content_tag(:button, 
          content_tag(:span, '&times;'.html_safe, 'aria-hidden' => true), type: 'button', class: 'close-button', "data-close" => '').concat(msg), 
      class: "callout #{key}", "data-closable" => ""
    end.join
  end
end
