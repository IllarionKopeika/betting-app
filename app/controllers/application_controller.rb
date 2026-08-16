class ApplicationController < ActionController::Base
  include Authentication

  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  allow_browser versions: :modern

  private

  def not_found(exception)
    logger.warn exception
    render file: "public/404.html", status: :not_found, layout: false
  end
end
