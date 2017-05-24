class BooksController < ApplicationController

  def show
    @book = Book.find params[:id]
  end

  def manage
    @authors = Author.all
    @category = Category.all
  end

  def new
    @book = Book.new
  end

  def create
    uploaded_io = params[:book][:image]
    if !uploaded_io.nil?
      filename = Digest::SHA1.hexdigest(Time.now.to_s + uploaded_io.original_filename)+'.jpg'
      File.open(Rails.root.join('public', 'images', 'bookcover', filename), 'wb') do |file|
        file.write(uploaded_io.read)
      end
      params[:book][:image] = filename
    else
      params[:book][:image] = ''
    end
    book_params = params.require(:book).permit(:title, :price, :qty, :image, :description)
    # author_params = params.require(:author).permit()
    @book = Book.new(book_params)
    if @book.valid?
      @book.save
    else
      render 'new'
    end
  end

end
