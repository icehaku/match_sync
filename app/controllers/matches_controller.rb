class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy,
    :status_update,
    :enter_slot,
    :clear_slot]

  def index
    @matches = Match.all
  end

  def show
  end

  def new
    @match = Match.new
    @match.owner = user

    respond_to do |format|
      if @match.save
        sync_new @match

        format.html { redirect_to @match, notice: 'Match was successfully created.' }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if is_owner
      @match.destroy
      sync_destroy @match

      respond_to do |format|
        format.html { redirect_to matches_url, notice: 'Match was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  def enter_slot
    case params["slot"].to_i
      when 1
        @match.update_attribute(:player_1, user) unless @match.player_1.present?
      when 2
        @match.update_attribute(:player_2, user) unless @match.player_2.present?
      when 3
        @match.update_attribute(:player_3, user) unless @match.player_3.present?
      when 4
        @match.update_attribute(:player_4, user) unless @match.player_4.present?
      when 5
        @match.update_attribute(:player_5, user) unless @match.player_5.present?
      when 6
        @match.update_attribute(:player_6, user) unless @match.player_6.present?
      when 7
        @match.update_attribute(:player_7, user) unless @match.player_7.present?
      when 8
        @match.update_attribute(:player_8, user) unless @match.player_8.present?
      when 9
        @match.update_attribute(:player_9, user) unless @match.player_9.present?
      when 10
        @match.update_attribute(:player_10, user) unless @match.player_10.present?
      else
        return
    end
    sync_update @match

    render nothing: true
  end

  def clear_slot
    if is_owner
      case params["slot"].to_i
        when 1
          @match.update_attribute(:player_1, "")
        when 2
          @match.update_attribute(:player_2, "")
        when 3
          @match.update_attribute(:player_3, "")
        when 4
          @match.update_attribute(:player_4, "")
        when 5
          @match.update_attribute(:player_5, "")
        when 6
          @match.update_attribute(:player_6, "")
        when 7
          @match.update_attribute(:player_7, "")
        when 8
          @match.update_attribute(:player_8, "")
        when 9
          @match.update_attribute(:player_9, "")
        when 10
          @match.update_attribute(:player_10, "")
        else
          return
      end
    end
    sync_update @match

    render nothing: true
  end

  def is_owner
    if session[:current_user]["uid"] == @match.owner
      true
    else
      false
    end
  end

  def status_update
    if is_owner
      if @match.status == "Open"
        @match.update_attribute(:status, "Closed")
      elsif @match.status == "Closed"
        @match.update_attribute(:status, "Finished")
      else
        @match.update_attribute(:status, "Open")
      end

      sync_update @match
    end

    render nothing: true
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_params
      params.require(:match).permit(:player_1, :player_2)
    end
end
