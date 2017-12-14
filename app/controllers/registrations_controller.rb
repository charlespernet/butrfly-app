class RegistrationsController < Devise::RegistrationsController
  def create
    resource = params[:user][:type].constantize.new(sign_up_params)
    resource.save
    resource = resource.acting_as
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      flash[:alert] = resource.errors.full_messages.first
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  protected

  def after_sign_in_path_for(resource_or_scope)
   current_user
  end

  def after_sign_up_path_for(resource)
    if resource.actable_type == "Aupair"
      edit_aupair_path(resource.actable)
    else
      edit_family_path(resource.actable)
    end
  end

end
