class RegistrationsController < Devise::RegistrationsController
  
  def create
    build_resource

    if resource.save
      set_flash_message :notice, :signed_up
      sign_in resource_name, resource, :bypass => true
      redirect_to root_url
    else
      clean_up_passwords(resource)
      flash.now[:error] = resource.errors.full_messages.first
      render_with_scope :new
    end
  end

  def update
    if resource.update_with_password(params[resource_name])
      set_flash_message :notice, :updated
      sign_in resource_name, resource, :bypass => true
      redirect_to edit_user_registration_url
    else
      clean_up_passwords(resource)
      flash.now[:error] = resource.errors.full_messages.first

      render_with_scope :edit
    end
  end

end
