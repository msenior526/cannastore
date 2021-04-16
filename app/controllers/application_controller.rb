class ApplicationController < ActionController::Base
  add_flash_types :success, :warning, :info
  include ApplicationHelper
  include StrainsHelper
end
