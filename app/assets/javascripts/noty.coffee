#= require noty/jquery.noty
#= require noty/layouts/bottomRight
#= require noty/themes/relax

$ = jQuery

# $.noty.defaults.timeout = 8000
$.noty.defaults.layout = 'bottomRight'
$.noty.defaults.theme = 'relax'

window.notyMessage = (text) ->
  noty(text: text, type: "success")

window.notyWarning =(text) ->
  noty(text: text, type: "warning")

window.notyError =(text) ->
  noty(text: text, type: "error")
