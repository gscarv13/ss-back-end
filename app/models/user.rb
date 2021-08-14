class User < ApplicationRecord
  EMAIL_REGEX = /\A([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})\z/i

  has_secure_password

  validates_presence_of :email
  validates_format_of :email, with: EMAIL_REGEX

  validates_presence_of :first_name
  validates_presence_of :last_name

  validates_uniqueness_of :email
end
