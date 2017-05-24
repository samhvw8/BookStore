class Order < ApplicationRecord
  belongs_to :user
  has_many :order_books

  def add_order_books(orderBook)

    unless order_books.count.zero?

      order_books.each do |ob|
        next if ob.book_id != orderBook.book_id
        return ob if ob.qty == ob.book.qty

        ob.qty = ob.qty + orderBook.qty
        if ob.qty > ob.book.qty
          ob.qty = ob.book.qty
        end
        ob.price = orderBook.price

        if ob.save
          return ob
        else
          return nil
        end
      end

    end
    orderBook.save
    order_books << orderBook
  end
end
