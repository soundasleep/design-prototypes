# empty
$(document).ready ->
  $(".dropdown").click (e) ->
    obj = $(e.target)
    if !obj.hasClass("dropdown")
      obj = obj.parent(".dropdown")

    if obj.hasClass("open")
      obj.removeClass("open")
      if obj.find("ul").length > 0
        obj.find("ul").slideUp(200)
      else
        obj.parent(".btn-group").find("ul").slideUp(200)
    else
      obj.addClass("open")
      if obj.find("ul").length > 0
        obj.find("ul").slideDown(200)
      else
        obj.parent(".btn-group").find("ul").slideDown(200)

    # prevent text selection
    if document.selection && document.selection.empty
      document.selection.empty()
    else if window.getSelection
      window.getSelection().removeAllRanges()

    return false

  # prevent closing when clicking on an open btn-group dropdown
  $(".btn-group ul").click () ->
    return false

  $(".dropdown").each (i, e) ->
    if !$(e).hasClass("open")
      if $(e).find("ul").length > 0
        $(e).find("ul").hide()
      else
        $(e).parent(".btn-group").find("ul").hide()

  $("body").click ->
    $(".dropdown.open.temporary").each (i, e) ->
      obj = $(e)
      obj.removeClass("open")
      if obj.find("ul").length > 0
        obj.find("ul").slideUp(200)
      else
        obj.parent(".btn-group").find("ul").slideUp(200)

  # make dropdowns unselectable
  $(".dropdown").attr("unselectable", "on").css("user-select", "none").on("selectstart", false)
