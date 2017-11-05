class Message < ApplicationRecord
  has_secure_token
  has_secure_password validations: false

  validates :text, length: { maximum: 500 }, presence: true

  def to_param
    token
  end
end
