class RulesController < ApplicationController
  before_action :set_rule, only: [:show, :edit, :update, :destroy]

  # GET /rules
  # GET /rules.json
  def index
    @rules = Rule.all
  end

  # GET /rules/1
  # GET /rules/1.json
  def show
    # TODO: どこかで環境変数として設定する
    secret_key = "t9QyglOldhvDHT91SGPuPeEpwX4WJV3L"
    # TODO: ルールによって有効期限を買えておく
    ttl = 3600
    peer_id = Time.now.to_i
    unix_timestamp=Time.now.to_i

    message = "#{unix_timestamp}:#{ttl}:#{peer_id}"
    hash = OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), secret_key, message)
    auth_token=Base64.encode64(hash).strip()


    credential = {
       peerId: peer_id,
       timestamp: unix_timestamp,
       ttl: ttl,
       authToken: auth_token
     }
    @credential= JSON.generate(credential)
    render :layout => "video_mode"
  end

  # GET /rules/new
  def new
    @rule = Rule.new
  end

  # GET /rules/1/edit
  def edit
  end

  # POST /rules
  # POST /rules.json
  def create
    @rule = Rule.new(rule_params)

    respond_to do |format|
      if @rule.save
        format.html { redirect_to @rule, notice: 'Rule was successfully created.' }
        format.json { render :show, status: :created, location: @rule }
      else
        format.html { render :new }
        format.json { render json: @rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rules/1
  # PATCH/PUT /rules/1.json
  def update
    respond_to do |format|
      if @rule.update(rule_params)
        format.html { redirect_to @rule, notice: 'Rule was successfully updated.' }
        format.json { render :show, status: :ok, location: @rule }
      else
        format.html { render :edit }
        format.json { render json: @rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rules/1
  # DELETE /rules/1.json
  def destroy
    @rule.destroy
    respond_to do |format|
      format.html { redirect_to rules_url, notice: 'Rule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rule
      @rule = Rule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rule_params
      params.require(:rule).permit(:name, :description, :limit_m)
    end
end
