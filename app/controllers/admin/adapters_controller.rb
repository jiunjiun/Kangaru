class Admin::AdaptersController < AdminController
  expose :adapters, -> { current_user.adapters }
  expose :adapter_line, -> { current_user.adapter_line }

  def index
  end

  def update
    case params[:adapter]
    when 'line'
      if adapter_line.update(adapter_line_params)
        redirect_to admin_adapters_path, notice: t('helpers.successfully_updated') and return
      else
        redirect_to admin_contact_path, alert: t('helpers.update_fail') and return
      end
    end
  end

  private
  def adapter_line_params
    params.require(:adapter_line).permit(:secret, :access_token)
  end
end
