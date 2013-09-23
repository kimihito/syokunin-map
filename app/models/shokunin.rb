class Shokunin < ActiveRecord::Base
  belongs_to :prefecture
  has_many :profiles, ->{order 'id DESC'}, dependent: :destroy
  belongs_to :profile
  scope :active, ->{where('profile_id is not NULL')}
  def profile_updated
    profile = profiles.first
    self.profile = profile.try(:active) ? profile : nil
    save
  end
end
