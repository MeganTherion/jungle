require 'active_support/core_ext/string/filters'

class User < ApplicationRecord
has_secure_password
validates_uniqueness_of :email, case_sensitive: false,  presence: true
validates :password, presence: true
validates :name, presence: true
validates :password, length: { minimum: 3 }

def self.authenticate_with_credentials(email, password)
 new_email = email.downcase.squish
 user = User.find_by_email(new_email)
 if user && user.authenticate(password)
  user
 else
  nil
end
end
end