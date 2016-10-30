class Visitor < ApplicationRecord
  belongs_to :user
  belongs_to :adapter

  has_many :messages

  def last_message
    message = self.messages.last
    case message.template_type
    when 'MessageText'
      message.template.text
    end
  end

  def last_time
    message = self.messages.last.created_at
  end
end
