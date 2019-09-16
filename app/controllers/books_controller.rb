class BooksController < ApplicationController
  def search
  	@book = Book.new
  	if params[:title]
  		@books = RakutenWebService::Books::Book.search(title: params[:title])
  	end
  end

  def create
  	@book = Book.new(book_params)
  	if @book.save
  		title = @book.title
  		author = @book.author
  		image = @book.smallImageUrl
  		url = @book.itemUrl

  		text = "本のタイトル:" + title + "\n" + "著者:" + author  + "\n" + url

   		Slack.chat_postMessage(text: text, channel: "#memo")
  		redirect_to '/'
  	else
  		redirect_to '/'
  	end
  end

  private
  def book_params
  	params.require(:book).permit(:title, :author, :smallImageUrl, :itemUrl)
  end

end