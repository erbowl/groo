class ThemasController < ApplicationController
  before_action :set_thema, only: [:show, :edit, :update, :destroy]

  # GET /themas
  # GET /themas.json
  def index
    @themas = Thema.all
  end

  # GET /themas/1
  # GET /themas/1.json
  def show
  end

  # GET /themas/new
  def new
    @thema = Thema.new
  end

  # GET /themas/1/edit
  def edit
  end

  # POST /themas
  # POST /themas.json
  def create
    @thema = Thema.new(thema_params)

    respond_to do |format|
      if @thema.save
        format.html { redirect_to @thema, notice: 'Thema was successfully created.' }
        format.json { render :show, status: :created, location: @thema }
      else
        format.html { render :new }
        format.json { render json: @thema.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /themas/1
  # PATCH/PUT /themas/1.json
  def update
    respond_to do |format|
      if @thema.update(thema_params)
        format.html { redirect_to @thema, notice: 'Thema was successfully updated.' }
        format.json { render :show, status: :ok, location: @thema }
      else
        format.html { render :edit }
        format.json { render json: @thema.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /themas/1
  # DELETE /themas/1.json
  def destroy
    @thema.destroy
    respond_to do |format|
      format.html { redirect_to themas_url, notice: 'Thema was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thema
      @thema = Thema.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def thema_params
      params.require(:thema).permit(:name, :genre)
    end
end
