# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  clipboard = new Clipboard('.btn-clipboard')
  clipboard.on 'success', (e)->
    alert(I18n.t('helpers.clipboarded'))
    e.clearSelection()

  $('#line_webhook_url').click -> this.select()

