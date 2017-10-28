class MessagesController < ApplicationController
  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = Message.find_by(id: params[:id])

    if @message.nil?
      respond_to do |format|
        format.html { render :not_found }
        format.json { render json: 'Not found' }
      end
    else
      @message.destroy
    end
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { render :created }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:text)
    end
end
