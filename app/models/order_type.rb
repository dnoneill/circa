class OrderType < ActiveRecord::Base

  has_many :order_sub_types

  def orders
    order_sub_types.flat_map { |ost| ost.orders }
  end

  def default_order_sub_type
    order_sub_types.where(default: true).first || order_sub_types.first
  end

  def default_order_sub_type_id
    if default_order_sub_type
      default_order_sub_type.id
    end
  end

end
