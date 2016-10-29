class Sender < ApplicationRecord
  belongs_to :user
  belongs_to :adapter

  has_many :messages
end
