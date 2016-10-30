module Admin::VisitorsHelper
  def visitor_from(identifier)
    identifier.split('_').first.capitalize
  end

  def visitor_name(visitor)
    identifier_id = visitor.identifier.split('_').last.first(10)
    if visitor.name.present?
      "#{visitor.name}(#{identifier_id})"
    else
      identifier_id
    end
  end
end
