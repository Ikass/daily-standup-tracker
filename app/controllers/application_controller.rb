class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  layout :layout_by_resource

  protected
  def layout_by_resource
    if controller_name.in?(%w[registrations sessions passwords invitations])
      "auth"
    else
      "application"
    end
  end
end
