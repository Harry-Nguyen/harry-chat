class User < ApplicationRecord
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :name, presence: true, length: {minimum: 3, message: "is too short."}
  has_secure_password

  def to_s
    name
  end
end
