module CurrentCart
	
	private 

		def set_cart
			@cart = Cart.find(session[:cart_id])
		rescue ActiveRecord::RecordNotFound
			@cart = Cart.create()
			session[:cart_id] = @cart.id 
		end

		def remove_cart 
			if @cart.restaurant_id != @restaurant.id 
				@cart.destroy
			end 
		end 
end

