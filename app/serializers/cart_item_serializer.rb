class CartItemSerializer < ActiveModel::Serializer
  attributes :id, :qty
  has_one :cart
  has_one :item
end
