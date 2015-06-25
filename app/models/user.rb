class User < ActiveRecord::Base
  validates :username, uniqueness: true
  validates :password, length: { minimum: 6}
end
