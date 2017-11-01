class Note < ApplicationRecord
  has_secure_token
  validates :text, length: { maximum: 500 }, presence: true

  def to_param
    token
  end
end
