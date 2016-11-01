json.name visitor_name(visitor)
json.avatar visitor.avatar
json.messages visitor.messages do |message|
  json.kind message.kind
  json.type message.template_type

  json.template do
    case message.template_type
    when 'MessageText'
      json.text message.template.text
      json.created_at l message.template.created_at, format: :long
    end
  end
end

