class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  def index
    render plain: "Beuni Gifts Management System is running!"
  end
end