class Shokunin < ActiveRecord::Base
  belongs_to :prefecture
  has_many :profiles, ->{order 'id DESC'}, dependent: :destroy
  belongs_to :profile
  scope :active, ->{where('active = ?',true)}
  def profile_updated
    profile = profiles.first
    self.profile = profile
    self.active = !!profile.try(:active)
    save
  end
end
