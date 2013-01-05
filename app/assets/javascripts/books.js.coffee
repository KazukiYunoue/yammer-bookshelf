$ ->
  $("div.books").each ->
    bookdiv = $(this)
    book_id = this.id
    category = this.title
    $.get "/books/"+book_id+".json?res="+category, (book) ->
      if category is "image_url"
        bookdiv.append ->
          $("<a href='/books/"+book.id+"'><img src='"+book.image_url+"'></a>").fadeIn("slow")
      else if category is "detail_page_url"
        word = book["#{category}"]
        bookdiv.append ->
          $("<a href='"+word+"' target=\"_blank\">Amazon</a>").fadeIn("slow")
      else
        word = book["#{category}"]
        bookdiv.replaceWith ->
          $("<div>"+word+"</div>").fadeIn("slow")
