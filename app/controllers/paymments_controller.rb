class PaymmentsController < ApplicationController
  before_action :set_paymment, only: [:show, :edit, :update, :destroy]

  # GET /paymments
  # GET /paymments.json
  def index
    @paymments = Paymment.all
  end

  # GET /paymments/1
  # GET /paymments/1.json
  def show
  end

  # GET /paymments/new
  def new
    @paymment = Paymment.new
  end

  # GET /paymments/1/edit
  def edit
  end

  # POST /paymments
  # POST /paymments.json
  def create
    @paymment = Paymment.new(paymment_params)

    respond_to do |format|
      if @paymment.save
        format.html { redirect_to @paymment, notice: 'Paymment was successfully created.' }
        format.json { render :show, status: :created, location: @paymment }
      else
        format.html { render :new }
        format.json { render json: @paymment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paymments/1
  # PATCH/PUT /paymments/1.json
  def update
    respond_to do |format|
      if @paymment.update(paymment_params)
        format.html { redirect_to @paymment, notice: 'Paymment was successfully updated.' }
        format.json { render :show, status: :ok, location: @paymment }
      else
        format.html { render :edit }
        format.json { render json: @paymment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paymments/1
  # DELETE /paymments/1.json
  def destroy
    @paymment.destroy
    respond_to do |format|
      format.html { redirect_to paymments_url, notice: 'Paymment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paymment
      @paymment = Paymment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def paymment_params
      params.require(:paymment).permit(:user_id, :ammount, :shipping, :cost, :detail_products, :detail_paymment, :detail, :state_payed, :state_shipped, :state_take)
    end
end
