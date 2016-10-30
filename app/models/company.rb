class Company < ApplicationRecord
  has_many :users

  has_many :adapters
  has_many :adapter_lines, through: :adapters, source: :adaptable, source_type: 'AdapterLine'

  has_many :visitors
  has_many :messages, through: :visitors

  after_create :setup_adapters

  def adapter_line
    self.adapter_lines.last
  end

  private
  def setup_adapters
    self.adapter_lines.create! secret: nil, access_token: nil
  end
end
