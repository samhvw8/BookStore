class OrderBooksController < ApplicationController
  def update
    order_book = OrderBook.find(params[:id])

    order_book.qty = params[:qty]
    order_book.qty = order_book.book.qty if order_book.qty > order_book.book.qty

    if order_book.save
      flash[:success] = 'Cart Updated !'
    else
      flash[:warning] = 'Cart not Updated !'
    end

    redirect_to carts_url
  end

  def destroy
    order_book = OrderBook.find(params[:id])
    unless order_book.nil?
      if order_book.destroy
        flash[:success] = "Book Delete !"
        redirect_to carts_url
      else
        flash[:danger] = "Book Not Delete !"
        redirect_to carts_url
      end
    end


  end
end