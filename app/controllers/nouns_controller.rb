class NounsController < ApplicationController
  before_filter :cancel_update, only: :update
  before_filter :signed_in_user
  before_filter :set_current_page
  before_filter :user_is_admin_or_creator, only: [:destroy, :edit]

  def index
    @noun = Noun.new
    @nouns = Noun.search(params[:search], params[:page])
    respond_to do |format|
      format.html # index.html.erb
      # format.json { render json: @nouns }
    end
  end

  def show
    @noun = Noun.find(params[:id])
    @nouns = Noun.search(params[:search], params[:page])
    render action: :index
  end

  # def edit
  #   @nouns = Noun.search(params[:search], params[:page])
  #   render action: :index
  # end

  def create
    @noun = Noun.new(params[:noun])
    @noun.created_by = current_user
    @noun.updated_by = current_user

    respond_to do |format|
      if @noun.save
        format.html { redirect_to nouns_path, notice: 'Noun was successfully created.' }
      else
        format.html { 
          @nouns = Noun.paginate(page: params[:page])
          render action: :index
        }
      end
    end
  end

  # PUT /nouns/1
  # PUT /nouns/1.json
  def update
    @noun = Noun.find(params[:id])
    params[:noun][:updated_by] = current_user

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

    def user_is_admin_or_creator
      @noun = Noun.find(params[:id])
      current_user.admin? || @noun.created_by == current_user
    end
end
