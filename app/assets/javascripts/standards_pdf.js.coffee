$ ->
  $("input[type=checkbox].pdf_standards").change ->
      ids = []
      $("input[type=checkbox].pdf_standards:checked").map ->
        ids.push @.id.split('_')[2]
      $("a#pdf_standards_link").attr('href', Routes.pdf_standards_path({ids:ids, format: 'pdf'}))

  $("a#pdf_standards_link").click ->
    $('#pdf_box').modal('hide')

  $("#pdf_standards_all").change ->
    checked = $(@).prop('checked')
    checkboxes = $("input[type=checkbox].pdf_standards")
    checkboxes.each ->
      $(@).prop('checked', checked)
    checkboxes.trigger('change')

