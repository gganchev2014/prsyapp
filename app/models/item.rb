class Item < ApplicationRecord

  has_many :user_profile_items
  has_many :items, through: :user_profile_items
end
