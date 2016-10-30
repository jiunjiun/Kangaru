# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  PUSH    = 1
  RECEIVE = 2
  $('#visitor_table tbody tr').click ->
    $('#chat_modal').find('.messages').html('')
    $('#chat_modal').modal('show')
    id = $(this).data('id')
    $.ajax "visitors/#{id}.json",
      datatype: 'json'
      success: (response) ->
        $.each response.messages, ( index, value ) ->
          if value.kind is PUSH
            data =
              text: value.template.text
              time: value.template.created_at
            message_html = HandlebarsTemplates['admin/visitors/push'](data)
          else
            data =
              name: response.name
              avatar: response.avatar
              text: value.template.text
              time: value.template.created_at
            message_html = HandlebarsTemplates['admin/visitors/receive'](data)

          $('#chat_modal').find('.messages').append(message_html)




