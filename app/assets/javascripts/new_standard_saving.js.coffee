autosaving = ->
  $.ajax
    url: Routes.api_standards_path()
    async: false
    dataType: "json"
    context: @
    type: "POST"
    data:
      standard: {name: $("#standard_name").val(), content: CKEDITOR.instances.standard_content.getData()}
#TODO: через gon кол-во секунд
#TODO: уведомлялку, что сохранение произошло
setInterval(autosaving, 120000)
