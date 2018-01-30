class BulletinsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_bulletin, only: [:show, :edit, :update, :destroy]

  # GET /bulletins
  # GET /bulletins.json
  def index
    @bulletins = Bulletin.order("created_at DESC").page params[:page]
  end

  # GET /bulletins/1
  # GET /bulletins/1.json
  def show
  end

  # GET /bulletins/new
  def new
    @bulletin = Bulletin.new
  end

  # GET /bulletins/1/edit
  def edit
  end

  # POST /bulletins
  # POST /bulletins.json
  def create
    @bulletin = Bulletin.new(bulletin_params)
    
    @bulletin.user_name = current_user.nickname

    respond_to do |format|
      if @bulletin.save
        format.html { redirect_to @bulletin, notice: '카테고리가 성공적으로 등록되었습니다.' }
        format.json { render :show, status: :created, location: @bulletin }
      else
        format.html { render :new }
        format.json { render json: @bulletin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bulletins/1
  # PATCH/PUT /bulletins/1.json
  def update
    respond_to do |format|
      if @bulletin.update(bulletin_params)
        format.html { redirect_to @bulletin, notice: '카테고리가 성공적으로 수정되었습니다.' }
        format.json { render :show, status: :ok, location: @bulletin }
      else
        format.html { render :edit }
        format.json { render json: @bulletin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bulletins/1
  # DELETE /bulletins/1.json
  def destroy
    @bulletin.destroy
    respond_to do |format|
      format.html { redirect_to bulletins_url, notice: '카테고리가 성공적으로 제거되었습니다.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bulletin
      @bulletin = Bulletin.find(params[:id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def bulletin_params
      params[:bulletin][:user_id] = current_user.id
      params.require(:bulletin).permit(:title, :content, :user_id, :info_part_time_job, :info_no_named, :info_room_trade, :info_trade, :promote_store, :vote, :seeking_room, :main_hidden, :member_boss, :member_univ, :member_real_estate)
    end
end
