$ ->
  $("input[type=checkbox].pdf_standards").change ->
      ids = []
      $("input[type=checkbox].pdf_standards:checked").map ->
        ids.push this.id.split('_')[2]
      $("a#pdf_standards_link").attr('href', Routes.pdf_standards_path({ids:ids, format: 'pdf'}))

$ ->
  $("#pdf_standards_link").click ->
    $('#pdf_box').modal('hide')

