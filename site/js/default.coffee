# empty
$(document).ready ->
  $(".dropdown").click (e) ->
    obj = $(e.target)
    if !obj.hasClass("dropdown")
      obj = obj.parent(".dropdown")

    if obj.hasClass("open")
      obj.removeClass("open")
      obj.find("ul").slideUp(200)
    else
      obj.addClass("open")
      obj.find("ul").slideDown(200)

    if document.selection && document.selection.empty
      document.selection.empty()
    else if window.getSelection
      window.getSelection().removeAllRanges()

    return false

  $(".dropdown").each (i, e) ->
    if !$(e).hasClass("open")
      $(e).find("ul").hide()

  $("body").click ->
    $(".dropdown.open.temporary").each (i, e) ->
      $(e).removeClass("open")
      $(e).find("ul").slideUp(200)

  # make dropdowns unselectable
  $(".dropdown").attr("unselectable", "on").css("user-select", "none").on("selectstart", false)
