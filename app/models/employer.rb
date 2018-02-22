class Employer < ActiveRecord::Base
  validates_presence_of :company_name, :email, :password
  validates_uniqueness_of :company_name
  has_secure_password

end
