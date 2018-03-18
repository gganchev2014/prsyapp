class UserProfileItem < ApplicationRecord
  belongs_to :user_profile
  belongs_to :item
end
