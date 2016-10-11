require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
  end

  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should get new" do
    get new_book_url
    assert_response :success
  end

  test "should create book" do
    assert_difference('Book.count') do
      post books_url, params: { book: { abstract: @book.abstract, author: @book.author, collection: @book.collection, condition: @book.condition, isbn_10: @book.isbn_10, isbn_13: @book.isbn_13, lang: @book.lang, name: @book.name, pages: @book.pages, price: @book.price, publisher: @book.publisher, quality: @book.quality, slug: @book.slug, stack: @book.stack, tags: @book.tags, user_id: @book.user_id } }
    end

    assert_redirected_to book_url(Book.last)
  end

  test "should show book" do
    get book_url(@book)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_url(@book)
    assert_response :success
  end

  test "should update book" do
    patch book_url(@book), params: { book: { abstract: @book.abstract, author: @book.author, collection: @book.collection, condition: @book.condition, isbn_10: @book.isbn_10, isbn_13: @book.isbn_13, lang: @book.lang, name: @book.name, pages: @book.pages, price: @book.price, publisher: @book.publisher, quality: @book.quality, slug: @book.slug, stack: @book.stack, tags: @book.tags, user_id: @book.user_id } }
    assert_redirected_to book_url(@book)
  end

  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete book_url(@book)
    end

    assert_redirected_to books_url
  end
end
