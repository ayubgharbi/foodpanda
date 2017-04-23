module CurrentCart
	
	private 

		def set_cart
			@cart = Cart.find(session[:cart_id])
			if @cart.restaurant_id != @restaurant.id 
				@cart.destroy(session[:cart_id])
        		session[:cart_id] = nil
			end 
		rescue ActiveRecord::RecordNotFound
			@cart = Cart.create()
			session[:cart_id] = @cart.id 
		end
end