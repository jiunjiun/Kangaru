class Admin::VisitorsController < AdminController
  expose :vitisors, -> { company.visitors }
  expose :visitor, find: ->(id, scope){ scope.includes(messages: [:template]).find(id) }

  def index
  end

  def show
    respond_to do |format|
      format.json
    end
  end
end
