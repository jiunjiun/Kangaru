module Admin::AdaptersHelper
  def line_webhook_path
    callback_url company.token, :line
  end
end
