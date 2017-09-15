class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from StandardError, with: :unhandled_error
  rescue_from ActiveRecord::RecordNotFound, with: :missing_error
  rescue_from ActionController::RoutingError, with: :missing_error

  def missing_error(exception)
    render file: 'public/404.html'
    error_log(exception)
  end

  private

  def unhandled_error(exception)
    render plain: '500 Something went wrong', status: :internal_server_error
    # render file: 'public/500.html', layout: false
    error_log(exception)
  end

  # error handing action
  def error_log(e = nil, custom_message = nil)
    # Writes exception data to error log
    error_logger ||= Logger.new("#{Rails.root}/log/error.log")

    error_logger.error("Rendering error with exception: controller => #{params[:controller]}, action => #{params[:action]}, #{e.inspect}") if e
    error_logger.error("Params => #{params.inspect}")
    error_logger.error("(Error has occured) :=> #{e.inspect} #{Rails.backtrace_cleaner.clean(e.backtrace)}") if e
    error_logger.error("(Custom Message) :=> #{custom_message}") if custom_message
  end
end