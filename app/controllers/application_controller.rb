class ApplicationController < ActionController::Base
  add_flash_types :success, :warning, :info
  include ApplicationHelper
  include FavoritesHelper

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
