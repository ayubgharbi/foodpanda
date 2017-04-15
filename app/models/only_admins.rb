class OnlyAdmins < ActiveAdmin::AuthorizationAdapter

  def authorized?(action, subject = nil)
    user.role == "superadmin" || user.role = "admin"
  end
end

