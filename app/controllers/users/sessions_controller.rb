class Users::SessionsController < Devise::SessionsController

  def create

  end

  protected

  def after_sign_in_path_for(resource)
    my_page_path
  end
end
