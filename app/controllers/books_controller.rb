class BooksController < ApplicationController
  load_and_authorize_resource :find_by => :slug
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def my
    @books = Book.where(["user_id = :u", { u: current_user.id }]).paginate(:page => params[:page])
  end

  # GET /books
  # GET /books.json
  def index
    # validar cercano
    #@users = User.where(active: true).where(gender: 'Male')

    @genders = Gender.all
    if params[:q]
      @books = Book.where('name LIKE ? OR author LIKE ? OR abstract LIKE ?', "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%").paginate(:page => params[:page])
    else
      @books = Book.paginate(:page => params[:page])
    end
    
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @comment = Comment.new
  end

  # GET /books/new
  def new
    @genders = Gender.all
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
    @genders = Gender.all
  end

  # POST /books
  # POST /books.json
  def create
    @genders = Gender.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.genders << Gender.friendly.find(params[:book][:gender_id])


    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update

    @book.genders.delete_all
    @book.genders << Gender.friendly.find(params[:book][:gender_id])

    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:name, :slug, :author, :publisher, :collection, :pages, :isbn_10, :isbn_13, :abstract, :lang, :condition, :stock, :price, :tags, :quality, :cover, :q)
    end
end
