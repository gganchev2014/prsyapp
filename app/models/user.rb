class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :email, uniqueness: true, email_format: { message: 'has invalid format' }

  def active?
    self.activation_state.to_s == 'active'
  end

  def pending?
    !self.active?
  end
end
