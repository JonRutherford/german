class SentencesController < ApplicationController
  before_filter :cancel_update, only: :update

  # GET /sentences
  # GET /sentences.json
  def index
    @sentence = Sentence.new
    @sentences = Sentence.paginate(page: params[:page])

    respond_to do |format|
      format.html # index.html.erb
      # format.json { render json: @sentences }
    end
  end

  def show
    @sentence = Sentence.find(params[:id])
    @sentences = Sentence.paginate(page: params[:page])
    render "index"
  end

  # GET /sentences/1/edit
  def edit
    @sentence = Sentence.find(params[:id])
    @sentences = Sentence.paginate(page: params[:page])    
    render "index"
  end

  # POST /sentences
  # POST /sentences.json
  def create
    @sentence = Sentence.new(params[:sentence])

    respond_to do |format|
      if @sentence.save
        format.html { redirect_to sentences_path, notice: 'Sentence was successfully created.' }
        format.json { render json: @sentence, status: :created, location: @sentence }
      else
        format.html { render action: "new" }
        # format.json { render json: @sentence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sentences/1
  # PUT /sentences/1.json
  def update
    @sentence = Sentence.find(params[:id])

    respond_to do |format|
      if @sentence.update_attributes(params[:sentence])
        format.html { redirect_to sentences_path, notice: 'Sentence was successfully updated.' }
        # format.json { head :no_content }
      else
        format.html { 
          @sentences = Sentence.paginate(page: params[:page])
          render action: :index
        }
        # format.json { render json: @sentence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sentences/1
  # DELETE /sentences/1.json
  def destroy
    @sentence = Sentence.find(params[:id])
    @sentence.destroy

    respond_to do |format|
      format.html { redirect_to sentences_url }
      # format.json { head :no_content }
    end
  end

  private
    def cancel_update
      redirect_to sentences_path if params[:commit] == "Cancel"
    end
end
