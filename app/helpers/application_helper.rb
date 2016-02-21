module ApplicationHelper


    def is_active_controller(controller_name)
        params[:controller] == controller_name ? "active" : nil
    end

    def is_active_action(action_name)
        params[:action] == action_name ? "active" : nil
    end

    def parse_date(value, format = :default)
      value.to_time.to_s(format)
    rescue
          value.to_s
    end

    def get_regularizado_class(regularizado)
      status = String.new

      if regularizado
          status = "fa fa-check-circle fa-2x text-success center-block"
      else
          status = "fa fa-times-circle fa-2x text-danger center-block"
      end
      status
    end

end
