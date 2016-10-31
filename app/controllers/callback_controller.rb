class CallbackController < ApplicationController
  skip_before_action :verify_authenticity_token

  expose :company, -> { Company.find_by_token(params[:company_token]) }

  def index
    if company.present?
      case params[:adapter]
      when "line"
        line_callback = Line::Callback.new company, request

        unless true
          render status: 400, text: 'Bad Request' and return
        else
          line_callback.parse_events
          render text: "OK" and return
        end
      end
    else
      render status: 400, text: 'Bad Request' and return
    end
  end
end
