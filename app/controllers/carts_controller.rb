class CartsController < ApplicationController
  def show
    session.delete(:add_to_cart)
    @order = current_user.get_order
  end

  def update
    book = Book.find params[:id]

    order = current_user.get_order

    order_book = OrderBook.new(book: book, price: book.price, qty: 1)

    if order.add_order_books(order_book)
      # sucess
      flash[:success] = "Book '" + book.title + "' have been add to cart"
      session[:add_to_cart] = true
    else
      flash[:danger] = "Book '" +book.title + "' have been failed add to cart !!"
      session.delete(:add_to_cart)
    end

    redirect_to book_path(params[:id])
  end

  def destroy
    order = current_user.get_order

    if !order.nil?
      order.destroy
      flash[:success] = 'Cart deleted'
    else
      flash[:warning] = 'Cart Empty !'
    end

    redirect_to carts_url
  end
end
