class LineItem < ApplicationRecord
  after_update :check_qty, if: "qty_changed?"

  belongs_to :order, optional: true
  belongs_to :food, optional: true
  belongs_to :cart
  belongs_to :restaurant
  belongs_to :user

  def total_price
  	food.price * quantity 
  end

  private

   def check_qty
     self.destroy if self.qty.zero?
   end

end
