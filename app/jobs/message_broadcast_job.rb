class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform message
    visitor = message.visitor
    current_company = message.visitor.company.id

    data = {
      name: visitor_name(visitor),
      avatar: visitor.avatar,
      type: message.template_type,
      template: message.template.as_json(except: [:id, :updated_at])
    }

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
end
