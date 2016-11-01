class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform message
    visitor = message.visitor
    current_company = message.visitor.company.id

    data = {
      name: visitor_name(visitor),
      avatar: visitor.avatar,
      type: message.template_type,
      template: template_format message
    }

    push_adapter visitor, message if message.kind == Message::Kind::PUSH
    ActionCable.server.broadcast "company_#{current_company}", action: message.kind, message: data
  end

  private
  # def render_message(whosay, message)
  #   ApplicationController.renderer.render(partial: 'messages/message', locals: {message: message, whosay: whosay})
  # end

  def visitor_name(visitor)
    identifier_id = visitor.identifier.split('_').last.first(10)
    if visitor.name.present?
      "#{visitor.name}(#{identifier_id})"
    else
      identifier_id
    end
  end

  def template_format message
    case message.template_type
    when 'MessageText'
      {
        text: message.template.text,
        created_at: I18n.l message.template.created_at, format: :long
      }
    end
  end

  def push_adapter visitor, message
    company = visitor.company
    visitor_identifier_id = visitor.identifier.split('_').last
    case visitor.adapter.adaptable_type
    when 'AdapterLine'
      Line::Message.push company, visitor_identifier_id, message
    end
  end
end
