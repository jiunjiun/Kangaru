class AdapterLine < ApplicationRecord
  has_one :adapter, as: :adaptable, dependent: :destroy
end
