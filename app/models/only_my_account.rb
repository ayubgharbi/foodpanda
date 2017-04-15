class OnlyMyAccount < ActiveAdmin::AuthorizationAdapter

  def authorized?(action, subject = nil)
    user.role == "superadmin" || user.role = "admin"
  end

  def scope_collection(collection, action = Auth::READ)
    if user.role == "superadmin"
      collection
    elsif user.role == "admin"
      collection.where(restaurant_id: user.restaurant_id)
    end
  end
end

