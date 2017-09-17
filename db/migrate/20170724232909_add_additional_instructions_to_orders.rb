class AddAdditionalInstructionsToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :additional_instructions, :text
  end
end
