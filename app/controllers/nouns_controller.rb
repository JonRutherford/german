class NounsController < ApplicationController
  before_filter :cancel_update, only: :update

  # GET /nouns
  # GET /nouns.json
  def index
    @noun = Noun.new
    @category = Category.find(id: params[:category_id]) if params[:category_id]

    @nouns = Noun.search(params[:search], params[:page])

    respond_to do |format|
      format.html # index.html.erb
      # format.json { render json: @nouns }
    end
  end

  def show
    @noun = Noun.find(params[:id])
    @nouns = Noun.search(params[:search], params[:page])
    render "index"
  end

  # GET /nouns/1/edit
  def edit
    @noun = Noun.find(params[:id])
    @nouns = Noun.search(params[:search], params[:page])
    render "index"
  end

  # POST /nouns
  # POST /nouns.json
  def create
    @noun = Noun.new(params[:noun])

    respond_to do |format|
      if @noun.save
        format.html { redirect_to nouns_path, category_id: @noun.category_id, notice: 'Noun was successfully created.' }
        format.json { render json: @noun, status: :created, location: @noun }
      else
        format.html { render action: "new" }
        # format.json { render json: @noun.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /nouns/1
  # PUT /nouns/1.json
  def update
    @noun = Noun.find(params[:id])

    respond_to do |format|
      if @noun.update_attributes(params[:noun])
        format.html { redirect_to nouns_path, notice: 'Noun was successfully updated.' }
        # format.json { head :no_content }
      else
        format.html { 
          @nouns = Noun.paginate(page: params[:page])
          render action: :index
        }
        # format.json { render json: @noun.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nouns/1
  # DELETE /nouns/1.json
  def destroy
    @noun = Noun.find(params[:id])
    @noun.destroy

    respond_to do |format|
      format.html { redirect_to nouns_url }
      # format.json { head :no_content }
    end
  end

  private
    def cancel_update
      redirect_to nouns_path if params[:commit] == "Cancel"
    end
end
