# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  PUSH    = 1
  RECEIVE = 2

  uid = undefined
  $('#visitor_table tbody tr').click ->
    id  = $(this).data('id')
    uid = $(this).data('uid')
    visitor_name = $(this).find('td').eq(2).html()
    setup_modal(id, visitor_name)
    $.ajax "visitors/#{id}.json",
      datatype: 'json'
      success: (response) ->
        $.each response.messages, ( index, value ) ->
          switch value.kind
            when PUSH
              data =
                text: value.template.text
                time: value.template.created_at
              message_html = HandlebarsTemplates['admin/visitors/push'](data)
            when RECEIVE
              data =
                name: response.name
                avatar: response.avatar
                text: value.template.text
                time: value.template.created_at
              message_html = HandlebarsTemplates['admin/visitors/receive'](data)

          $('#chat_modal').find('.messages').append(message_html)


  setup_modal = (id, visitor_name) ->
    modal = $('#chat_modal')

    # reset message
    modal.find('.messages').html('')

    # setting id to modal
    modal.attr('data-id', id)

    # setting visitor_name to modal
    modal.find('.modal-title').html(visitor_name)

    # show modal
    modal.modal('show')

  handleEnter = (evt) ->
    if evt.keyCode is 13 && !evt.shiftKey
      message = $(this).val()
      App.chat.push(uid, message)
      $(this).val('')
      evt.preventDefault()
    return

  $('#input_message').keydown(handleEnter).keypress(handleEnter)
