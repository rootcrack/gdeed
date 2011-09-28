class Admin::BaseController < ApplicationController
  before_filter :authenticate_admin
  layout 'admin'
  private
  def authenticate_admin
    raise "You do not have access to this area!" if current_user.username != "admin"# || is_admin?
  end
end