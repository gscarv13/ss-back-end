class User < ApplicationRecord
  EMAIL_REGEX = /\A([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})\z/i

  has_secure_password

  validates :password, length: { minimum: 8 }
  validates :first_name, length: { minimum: 2 }
  validates :last_name, length: { minimum: 2 }

  validates_presence_of :email, :first_name, :last_name
  validates_format_of :email, with: EMAIL_REGEX

  validates_uniqueness_of :email
end
