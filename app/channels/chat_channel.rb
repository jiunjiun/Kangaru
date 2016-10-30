# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ChatChannel < ApplicationCable::Channel

  def subscribed
    stream_from "company_#{current_company}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def push(data)
    company = Company.find(current_company)
    user    = company.users.find(current_user)

    opts = {
      message: {type: :text, text: data['message']},
      visitor: {user_id: data['user_id']}
    }

    Message.push user, opts
  end
end
