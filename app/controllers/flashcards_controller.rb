class FlashcardsController < ApplicationController
  before_action :set_flashcard, only: %i[ show edit update destroy ]

  # GET /flashcards or /flashcards.json
  def index
    @flashcards = Flashcard.all
  end

  # GET /flashcards/1 or /flashcards/1.json
  def show
  end

  # GET /flashcards/new
  def new
    @flashcard = Flashcard.new
  end

  # GET /flashcards/1/edit
  def edit
  end

  # POST /flashcards or /flashcards.json
  def create
    @flashcard = Flashcard.new(flashcard_params)

    respond_to do |format|
      if @flashcard.save
        format.html { redirect_to @flashcard, notice: "Flashcard was successfully created." }
        format.json { render :show, status: :created, location: @flashcard }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @flashcard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flashcards/1 or /flashcards/1.json
  def update
    respond_to do |format|
      if @flashcard.update(flashcard_params)
        format.html { redirect_to @flashcard, notice: "Flashcard was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @flashcard }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @flashcard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flashcards/1 or /flashcards/1.json
  def destroy
    @flashcard.destroy!

    respond_to do |format|
      format.html { redirect_to flashcards_path, notice: "Flashcard was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flashcard
      @flashcard = Flashcard.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def flashcard_params
      params.expect(flashcard: [ :word, :meaning, :example, :level ])
    end
end
