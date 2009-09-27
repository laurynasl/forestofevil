module Merb
  module GlobalHelpers
    # helpers defined here available to all views.  

    def fixed_form_for(object, options = {}, &block)
      controller_name = (options.delete(:controller_name) || object.class.name).underscore.singular
      options[:action] ||= (object.id ? url(controller_name.to_sym, :id => object.id) : url(controller_name.plural.to_sym))
      form_for(object, options, &block)
    end

    def clear
      '<div style="clear:both;"></div>'
    end

    def button_to(title, link, options={}, button_options={})
      options[:action] ||= link
      form(options) do
        submit(title, button_options)
      end
    end

    def current_user
      @current_user ||= session.user 
    end

    def datetime(t)
      t.strftime("%Y-%m-%d %H:%M") if t
    end

    def forum_format(text)
      cleaned = Sanitize.clean(text, Sanitize::Config::BASIC)
      '<div class="forum_format">' + RedCloth.new(cleaned).to_html + '</div>'
    end

    # perdengia tikrąjį metodą, kuriame yra dvigubo unescape klaida
    def message
      return {} unless params[:_message]
      begin
        Marshal.load(params[:_message].unpack("m").first)
      rescue ArgumentError, TypeError
        {}
      end
    end
  end
end
