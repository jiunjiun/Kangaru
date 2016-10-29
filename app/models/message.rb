class Message < ApplicationRecord
  belongs_to :visitor
  belongs_to :user, optional: true
  belongs_to :template, polymorphic: true


  def self.push user, adapter, opts={}
    ActiveRecord::Base.transaction do
      message_info = opts[:message]
      if message_info.present?
        template = message_tempalte message_info
      end

      visitor_info = opts[:visitor]
      if visitor_info.present?
        visitor = visitor_info user, adapter, visitor_info
      end

      if template.present? and visitor.present?
        create!({
          kind: KeyValues::MessageKind.find_by_code('push').id,
          user: user,
          visitor: visitor,
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

      visitor_info = opts[:visitor]
      if visitor_info.present?
        visitor = visitor_info user, adapter, visitor_info
      end

      if template.present? and visitor.present?
        create!({
          kind: KeyValues::MessageKind.find_by_code('receive').id,
          visitor: visitor,
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

  def self.visitor_info user, adapter, visitor_info
    prefix  = adapter.adaptable_type.gsub('Adapter', '').downcase
    user_id = visitor_info[:user_id]
    visitor = Visitor.find_or_create_by!(identifier: "#{prefix}_#{user_id}") do |visitor|
      visitor.user_id = user.id
      visitor.adapter_id = adapter.id
    end
  end
end
