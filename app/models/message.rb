class Message < ApplicationRecord
  validates :text, length: { maximum: 150 }, presence: true
end
