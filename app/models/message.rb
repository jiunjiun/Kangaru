class Message < ApplicationRecord
  belongs_to :sender
  belongs_to :user, optional: true
  belongs_to :template, polymorphic: true


  def self.push user, adapter, opts={}
    ActiveRecord::Base.transaction do
      message_info = opts[:message]
      if message_info.present?
        template = message_tempalte message_info
      end

      sender_info = opts[:sender]
      if sender_info.present?
        sender = sender_info user, adapter, sender_info
      end

      if template.present? and sender.present?
        create!({
          kind: KeyValues::MessageKind.find_by_code('push').id,
          user: user,
          sender: sender,
          template: template
        })
      end
    end
  end

  def self.receive user, adapter, opts={}
    ActiveRecord::Base.transaction do
      message_info = opts[:message]
      if message_info.present?
        template = message_tempalte message_info
      end

      sender_info = opts[:sender]
      if sender_info.present?
        sender = sender_info user, adapter, sender_info
      end

      if template.present? and sender.present?
        create!({
          kind: KeyValues::MessageKind.find_by_code('receive').id,
          sender: sender,
          template: template
        })
      end
    end
  end

  private
  def self.message_tempalte message_info
    case message_info[:type]
    when :text
      MessageText.create(text: message_info[:text])
    end
  end

  def self.sender_info user, adapter, sender_info
    prefix  = adapter.adaptable_type.gsub('Adapter', '').downcase
    user_id = sender_info[:user_id]
    sender = Sender.find_or_create_by!(identifier: "#{prefix}_#{user_id}") do |sender|
      sender.user_id = user.id
      sender.adapter_id = adapter.id
    end
  end
end
