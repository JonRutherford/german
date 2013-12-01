class VerbsController < ApplicationController
  before_filter :cancel_update, only: :update
  before_filter :signed_in_user
  before_filter :set_current_page
  before_filter :user_is_admin_or_creator, only: [:destroy, :edit]

  def index
    @verb = Verb.new
    @verb.infinitive = Word.new
    @verb.present_tense = Tense.new
    @verbs = Verb.search(params[:search], params[:page])
    respond_to do |format|
      format.html
    end
  end

  def show
    @verb = Verb.find(params[:id])
    @verbs = Verb.search(params[:search], params[:page])
    render action: :index
  end

  def create
    @verb = Verb.new(params[:verb])
    @verb.created_by = current_user
    @verb.updated_by = current_user

    respond_to do |format|
      if @verb.save
        format.html { redirect_to verbs_path, notice: 'Verb was successfully created.' }
      else
        format.html { 
          @verbs = Verb.paginate(page: params[:page])
          render action: :index
        }
      end
    end
  end

  def update
    @verb = Verb.find(params[:id])
    params[:verb][:updated_by] = current_user

    respond_to do |format|
      if @verb.update_attributes(params[:verb])
        format.html { redirect_to verbs_path, notice: 'Verb was successfully updated.' }
      else
        format.html { 
          @verbs = Verb.paginate(page: params[:page])
          render action: :index
        }
      end
    end
  end

  def destroy
    @verb.destroy

    respond_to do |format|
      format.html { redirect_to verbs_url }
    end
  end

  private
    def cancel_update
      redirect_to verbs_path if params[:commit] == "Cancel"
    end

    def user_is_admin_or_creator
      @verb = Verb.find(params[:id])
      current_user.admin? || @verb.created_by == current_user
    end
end