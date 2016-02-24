class ReplaysController < ApplicationController
   def index
      @replays = Replay.all
   end

   def new
      @replay = Replay.new
   end

   def create
      @replay = Replay.new(replay_params)

      if @replay.save
         redirect_to replays_path, notice: "The replay #{@replay.name} has been uploaded."
      else
         render "new"
      end

   end

   def destroy
      @replay = Replay.find(params[:id])
      @replay.destroy
      redirect_to replays_path, notice:  "The replay #{@replay.name} has been deleted."
   end

   private
      def replay_params
      params.require(:replay).permit(:name, :attachment)
   end

end
