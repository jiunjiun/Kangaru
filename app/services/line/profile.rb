require 'line/bot'
module Line
  class Profile
    def self.get company, user_id
      new(company, user_id).get_profile
    end

    def initialize company, user_id
      @company = company
      @user_id = user_id
    end

    def get_profile
      response = client.get_profile(@user_id)
      case response
      when Net::HTTPSuccess then
        JSON.parse(response.body)
      else
        {}
      end
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
