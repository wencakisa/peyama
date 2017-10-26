class Message < ApplicationRecord
  validates :text, length: { maximum: 500 }, presence: true
end
