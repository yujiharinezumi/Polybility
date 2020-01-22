module ApplicationHelper
  def flash_message(message, klass)
    content_tag(:div, class: "alert alert-#{klass}") do
      concat content_tag(:button, 'x', class: 'close', data: {dismiss: 'alert'})
      concat raw(message)
    end
  end

  # def i18n_url_for(options)
  #    if options[:locale] == I18n.default_locale
  #      options[:locale] = nil
  #    end
  #  url_for(options)
  # end
end
