class SrsnacksController < ApplicationController
  before_action :set_srsnack, only: [:show, :edit, :update, :destroy]

  # GET /srsnacks
  # GET /srsnacks.json
  def index
    @srsnacks = Srsnack.all
  end

  # GET /srsnacks/1
  # GET /srsnacks/1.json
  def show
  end

  # GET /srsnacks/new
  def new
    @srsnack = Srsnack.new
  end

  # GET /srsnacks/1/edit
  def edit
  end

  # POST /srsnacks
  # POST /srsnacks.json
  def create
    @srsnack = Srsnack.new(srsnack_params)

    respond_to do |format|
      if @srsnack.save
        format.html { redirect_to @srsnack, notice: 'Srsnack was successfully created.' }
        format.json { render :show, status: :created, location: @srsnack }
      else
        format.html { render :new }
        format.json { render json: @srsnack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /srsnacks/1
  # PATCH/PUT /srsnacks/1.json
  def update
    respond_to do |format|
      if @srsnack.update(srsnack_params)
        format.html { redirect_to @srsnack, notice: 'Srsnack was successfully updated.' }
        format.json { render :show, status: :ok, location: @srsnack }
      else
        format.html { render :edit }
        format.json { render json: @srsnack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /srsnacks/1
  # DELETE /srsnacks/1.json
  def destroy
    @srsnack.destroy
    respond_to do |format|
      format.html { redirect_to srsnacks_url, notice: 'Srsnack was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_srsnack
      @srsnack = Srsnack.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def srsnack_params
      params.require(:srsnack).permit(:name, :follow_count, :photo, :pchome_url)
    end
end
