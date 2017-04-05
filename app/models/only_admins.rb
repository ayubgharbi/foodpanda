class OnlyAdmins < ActiveAdmin::AuthorizationAdapter
  def authorized?(action, subject = nil)
    return true if user.role == “superadmin”
    subject.restaurant_id == user.restaurant_id

    #if user.role == “superadmin”
    #  true
    #elsif user.role == “admin”
    #  subject.restaurant_id == user.restaurant_id
    #end
  end

  def scope_collection(collection, action = Auth::READ)
    if user.role == “superadmin”
      collection
    elsif user.role == “admin”
      collection.where(restaurant_id: user.restaurant_id)
    end
  end
end
