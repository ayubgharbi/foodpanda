class LineItem < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :food, optional: true
  belongs_to :cart

  def total_price
  	food.price * quantity 
  end

  private

   def check_qty
     self.destroy if self.qty.zero?
   end

end
