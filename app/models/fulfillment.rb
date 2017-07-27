class Fulfillment < ApplicationRecord
  belongs_to :order, optional: true
  has_many :line_items

  enum ship_type: {
    "pickup"           => 0,
    "mail"     => 1
  }
end
