module ApplicationHelper
	def hidden_div_if(condition, attributes = {}, &block)
		if condition
			attributes["style"] = "display: none"
		end
		content_tag("div", attributes, &block)
	end

	def button_to_with_icon(text, path, classes)
	  form_tag path, :method => :post do
	    button_tag(classes) do
	      raw text
	    end
	  end
	end

	def is_active(action)       
    	params[:action] == action ? "active" : nil        
  end
end

