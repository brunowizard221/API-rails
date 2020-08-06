class Contact < ApplicationRecord

  #gem kaminari
  paginates_per 5

  belongs_to :kind
  has_many :phones
  has_one :address

  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address
end
