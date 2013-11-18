autosaving = ->
  id = $("#native_id").text()
  $.ajax
    url: Routes.api_standard_path({id: id})
    async: true
    dataType: "json"
    context: @
    type: "PUT"
    data:
      standard: {name: $("#standard_name").val(), content: CKEDITOR.instances.standard_content.getData()}
#TODO: через gon кол-во секунд
#TODO: уведомлялку, что сохранение произошло
setInterval(autosaving, 120000)
