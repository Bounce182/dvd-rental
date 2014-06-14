class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, :with => :render_error
    rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found
    rescue_from ActionController::RoutingError, :with => :render_not_found
  end

  def raise_not_found
    to_log(nil, "No route matches #{params}")
    render_file(404)
  end

  def render_error(e)
    to_log(e)
    render_file(500)
  end

  def render_not_found(e)
    to_log(e)
    render_file(404)
  end

  private
  def set_logger
    @logger = Logger.new("#{Rails.root}/log/error.log")
  end

  def render_file(status, layout = false)
    render :file => "#{Rails.root}/public/#{status}.html", :status => status, :layout => layout
  end

  def to_log(e, additional_msg = '')
    set_logger
    s =  "\n====================================================\n"

    if e != nil
      s += "#{additional_msg} #{e.message}"
      s += e.backtrace.join("\n")
    else
      s += "#{additional_msg}"
    end

    s +=  "\n====================================================\n"

    @logger.error s
  end

end
