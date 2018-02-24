class User < ApplicationRecord
  authenticates_with_sorcery!

  def active?
    self.activation_state.to_s == 'active'
  end

  def pending?
    !self.active?
  end
end
