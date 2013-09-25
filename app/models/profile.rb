class Profile < ActiveRecord::Base
  belongs_to :shokunin
  after_save do
    shokunin.profile_updated
  end
end
