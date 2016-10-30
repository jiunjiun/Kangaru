PUSH    = 1
RECEIVE = 2

App.chat = App.cable.subscriptions.create { channel: "ChatChannel" },
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log 'connected'

  disconnected: ->
    # Called when the subscription has been terminated by the server
    console.log 'disconnected'

  received: (data) ->
    switch data.action
      when PUSH
        message =
          text: data.message.template.text
          time: data.message.template.created_at
        message_html = HandlebarsTemplates['admin/visitors/push'](message)
      when RECEIVE
        message =
          name: data.message.name
          avatar: data.message.avatar
          text: data.message.template.text
          time: data.message.template.created_at
        message_html = HandlebarsTemplates['admin/visitors/receive'](message)

    $('#chat_modal').find('.messages').append(message_html).scrollTop(99999)

  push: (user_id, message) ->
    data = {
      user_id: user_id
      message: message
    }
    @perform 'push', data
