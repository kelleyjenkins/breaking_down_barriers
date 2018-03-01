class User < ActiveRecord::Base
  has_one :profile
  has_many :mentorships
  has_many :mentors, :through => :mentorships
  has_many :inverse_mentorships, :class_name => "Mentorship", :foreign_key => "mentor_id"
  has_many :inverse_mentors, :through => :inverse_mentorships, :source => :user

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.save!
    end
  end

end
