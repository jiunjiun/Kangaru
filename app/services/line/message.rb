require 'line/bot'
module Line
  class Message
    def self.push company, user_id, message
      new(company, user_id, message).push
    end

    def initialize company, user_id, message
      @company = company
      @user_id = user_id
      @message = message
    end

    def push
      case @message.template_type
      when 'MessageText'
        message = {
          type: "text",
          text: @message.template.text
        }
      end
      result = client.push_message(@user_id, message)
    end

    private
    def client
      @client ||= Line::Bot::Client.new { |config|
        config.channel_secret = @company.adapter_line.secret
        config.channel_token  = @company.adapter_line.access_token
      }
    end
  end
end
