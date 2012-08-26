class MessagesController < ApplicationController
  def send_to
    user = User.find(params[:user_id])
    book = Book.find(params[:book_id])

    message_detail = {
      :body => "#{current_user.nickname} want to lent a your book #{book.isbn}.",
      :direct_to_id => user.uid,
      :broadcast => false
    }

    #message = Message.new(message_detail)
    #message.save

    redirect_to :back
  end

end
