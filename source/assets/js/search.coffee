//= require jquery

$ = jQuery

$ ->

  $('.search-query').live 'keypress', (e) ->
    if e.keyCode == 13
      e.preventDefault()
      search_term = $('.search-query').val().toLowerCase()
      $.getJSON '/entries.json', (data) ->
        results = []
        for i in data
          value = 0
          if i.title.toLowerCase().split(search_term).length - 1 isnt 0
            value = 10
          if i.content.toLowerCase().split(search_term).length - 1 isnt 0
            value += (i.content.toLowerCase().split(search_term).length - 1) * 5
          if value isnt 0
            i.value = value
            results.push i
        $('#search-results').html ''
        if results.length > 0
          $('#search-results').append '<h1>Search results</h1>'
          $('#search-results').append '<p><ul>'
          for result in results
            $('#search-results').append '<li><a href="'+result.url+'">'+result.title+'</a></li>'
          $('#search-results').append '</ul></p>'
          $('#search-block').toggleClass('in')
          $('#search-block').removeAttr('style')
        else
          $('#search-results').append '<p>No results found.</p>'
          return
