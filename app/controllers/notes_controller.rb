class NotesController < ApplicationController
  skip_before_action :verify_authenticity_token, if: :api_request?

  def show
    @note = Note.find_by token: params[:token]

    if @note.nil?
      render :not_found
    else
      @note.destroy
    end
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new note_params

    respond_to do |format|
      if @note.save
        format.html             { render :created }
        format.all(:xml, :json) { render :show }
      else
        format.html { render :new }
        format.xml  { render xml: @note.errors }
        format.json { render json: @note.errors }
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

    def note_params
      note = if xml_request?
               Nokogiri::XML.fragment(request.body.read).content
             else
               params.require(:note)
             end

      if api_request?
        { text: note }
      else
        note.permit(:text)
      end
    end
end
