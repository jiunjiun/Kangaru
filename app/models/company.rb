class Company < ApplicationRecord
  has_many :users

  has_many :adapters
  has_many :adapter_lines, through: :adapters, source: :adaptable, source_type: 'AdapterLine'

  has_many :visitors
  has_many :messages, through: :visitors

  before_create :generate_token
  after_create :setup_adapters

  def adapter_line
    self.adapter_lines.last
  end

  private
  def setup_adapters
    self.adapter_lines.create! secret: nil, access_token: nil
  end

  def generate_token
    self.token = loop do
      random_token = (0...5).map { (('A'..'Z').to_a+('0'..'9').to_a)[rand(36)] }.join
      break random_token unless Company.exists?(token: random_token)
    end
  end
end
