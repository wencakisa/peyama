class messagesController < ApplicationController
  skip_before_action :verify_authenticity_token, if: :api_request?
  before_action :set_message, only: :show

  def show
    if @message.nil?
      render :not_found
    else
      @message.destroy
    end
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new message_params

    respond_to do |format|
      if @message.save
        format.html             { render :created }
        format.all(:xml, :json) { render :show }
      else
        format.html { render :new }
        format.xml  { render xml: @message.errors }
        format.json { render json: @message.errors }
      end
    end
  end

  private
    def xml_request?
      request.format.xml?
    end

    def json_request?
      request.format.json?
    end

    def api_request?
      xml_request? || json_request?
    end

    def set_message
      @message = Message.find_by token: params[:token]
    end

    def message_params
      message = if xml_request?
                  Nokogiri::XML.fragment(request.body.read).content
                else
                  params.require(:message)
                end

      if api_request?
        { text: message }
      else
        message.permit(:text, :password)
      end
    end
end
