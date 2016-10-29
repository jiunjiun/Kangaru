class Adapter < ApplicationRecord
  belongs_to :user
  belongs_to :adaptable, polymorphic: true

  has_one :sender
end
