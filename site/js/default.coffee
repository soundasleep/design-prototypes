# empty
$(document).ready ->
  $(".dropdown").click (e) ->
    obj = $(e.target).parent(".dropdown")
    if obj.hasClass("open")
      obj.removeClass("open")
    else
      obj.addClass("open")

    if document.selection && document.selection.empty
      document.selection.empty()
    else if window.getSelection
      window.getSelection().removeAllRanges()

    return false

  # make dropdowns unselectable
  $(".dropdown").attr("unselectable", "on").css("user-select", "none").on("selectstart", false)
