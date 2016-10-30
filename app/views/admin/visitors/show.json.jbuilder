json.name visitor_name(visitor)
json.avatar visitor.avatar
json.messages visitor.messages do |message|
  json.kind message.kind
  json.type message.template_type
  json.template message.template.as_json(except: [:id, :updated_at])
end

