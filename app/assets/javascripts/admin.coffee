#= require jquery_ujs
#= require cable

#= require PixelAdmin/bootstrap
#= require PixelAdmin/pixeladmin.min

#= require noty

#= require i18n
#= require i18n/translations

#= require clipboard

#= require handlebars.runtime
#= require_tree ./templates

#= require_tree ./admin
#= require_self

$ ->
  pxInit.unshift ->
    file = String(document.location).split('/').pop()
    # Remove unnecessary file parts
    file = file.replace(/(\.html).*/i, '$1')
    if !/.html$/i.test(file)
      file = 'index.html'
    # Activate current nav item
    $('#px-demo-nav').find('.px-nav-item > a[href="' + file + '"]').parent().addClass 'active'
    $('#px-demo-nav').pxNav()
    $('#px-demo-footer').pxFooter()
    return
  i = 0
  len = pxInit.length
  while i < len
    pxInit[i].call null
    i++

