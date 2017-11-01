class NotesController < ApplicationController
  def show
    @note = Note.find_by token: params[:token]

    if @note.nil?
      respond_to do |format|
        format.html { render :not_found }
        format.json { render json: 'Not found' }
      end
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
        format.html { render :created }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def note_params
      puts "Format: #{request.format.json?}"
      note = params.require(:note)

      if request.format.json?
        { text: note }
      else
        note.permit(:text)
      end
    end
end
