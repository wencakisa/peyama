class NotesController < ApplicationController
  # TODO: Make a confirm "show" page

  # GET /notes/1
  # GET /notes/1.json
  def show
    @note = Note.find_by(id: params[:id])

    if @note.nil?
      respond_to do |format|
        format.html { render :not_found }
        format.json { render json: 'Not found' }
      end
    else
      @note.destroy
    end
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(note_params)

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
    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:text)
    end
end
