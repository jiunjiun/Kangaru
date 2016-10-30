class Admin::VisitorsController < AdminController
  expose :vitisors, -> { company.visitors }
  expose :visitor

  def index
  end

  def show
    respond_to do |format|
      format.json
    end
  end
end
