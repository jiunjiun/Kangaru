class MessageText < ApplicationRecord
  has_one :message, as: :template, dependent: :destroy
end
