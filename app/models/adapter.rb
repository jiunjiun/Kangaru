class Adapter < ApplicationRecord
  belongs_to :company
  belongs_to :adaptable, polymorphic: true

  has_many :visitors
end
