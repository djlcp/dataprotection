class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  check_authorization

	rescue_from CanCan::AccessDenied do |exception|
	    respond_to do |format|
	      format.json { head :forbidden, content_type: 'text/html' }
	      format.html { redirect_to main_app.root_url, notice: exception.message }
	      format.js   { head :forbidden, content_type: 'text/html' }
	    end
	  end
 
  protected
	# This method is called upon invitation - permits commits to database of data other than password (namely first name, surname, manager? and job title)
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:invite, keys: [:first_name, :last_name, :job_title, :manager])
  end

end
