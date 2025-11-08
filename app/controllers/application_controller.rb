class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # allow_browser versions: :modern
  include Devise::Controllers::Helpers

  # Changes to the importmap will invalidate the etag for HTML responses
  # stale_when_importmap_changes
  protect_from_forgery with: :exception  
  before_action :authenticate_user!, unless: :devise_controller?


end



