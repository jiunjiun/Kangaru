require 'line/bot'
module Line
  class Callback
    def initialize company, request
      @company = company
      @request = request
    end

    def validate_signature?
      body      = @request.body.read
      signature = @request.env['HTTP_X_LINE_SIGNATURE']

      client.validate_signature(body, signature)
    end

    def parse_events
      body   = @request.body.read
      events = client.parse_events_from(body)
      events.each do |event|
        user_id = event['source']['userId']
        case event
        when Line::Bot::Event::Message
          response = nil
          case event.type
          when Line::Bot::Event::MessageType::Text
            opts = {
              message: {type: :text, text: event.message['text']},
              visitor: parse_profile(user_id)
            }
            receive opts
          end
        end
      end
    end

    private
    def client
      @client ||= Line::Bot::Client.new { |config|
        config.channel_secret = @company.adapter_line.secret
        config.channel_token  = @company.adapter_line.access_token
      }
    end

    def receive opts
      ::Message.receive @company, @company.adapter_line.adapter, opts
    end

    def parse_profile user_id
      profile = Line::Profile.get @company, user_id
      {
        user_id: profile['userId'],
        name: profile['displayName'],
        avatar: profile['pictureUrl'],
      }
    end
  end
end


