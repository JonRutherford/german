class QuizzesController < ApplicationController
  
  include QuizzesHelper

  before_filter :signed_in_user
  before_filter :hint
  before_filter :check_order, only: [:random_sentence, :translate_noun]
  before_filter :current_noun, except: [:index]
  before_filter :set_category, except: [:index]

  def index
  end

  def translate_noun
    @correct = !@noun.nil? && 
              ((@order == "de_to_en" && params[:answer] == @noun.english) ||
              (@order == "en_to_de" && params[:answer] == @noun.german))
    @noun = Noun.random if @noun.nil? || @correct
    respond_to do |format|
      format.html
      #format.js
    end
  end

  def der_die_das
    @definite_nominative_articles = ["der", "die", "das"]
    @correct = !@noun.nil? && @noun.article.nominative == params[:commit]
    @noun = Noun.random(@category) if @noun.nil? || @correct
    set_prev_answers
    respond_to do |format|
      format.html
      format.js { render :update_with_prev_answer_buttons }
    end
  end

  def pluralise
    @correct = !@noun.nil? && @noun.pluralisation_rule.rule == params[:commit]
    @noun = Noun.random(@category) if @noun.nil? || @correct
    set_prev_answers
    respond_to do |format|
      format.html
      format.js { render :update_with_prev_answer_buttons }
    end
  end

  private
    def current_noun
      @noun = Noun.where(id: params[:noun_id]).first
    end

    def hint
      redirect_to :index if params[:commit] == "Hint"
    end

    def check_order
      @is_random = !orders.include?(params[:order])
      @order = @is_random ? orders[rand(orders.count())] : params[:order]
    end

    def orders
      ["en_to_de", "de_to_en"]
    end

    def set_prev_answers
      params[:prev_answers] ||= []
      @prev_answers = @correct ? [] : params[:prev_answers]
      @prev_answers << params[:commit] unless @correct \
        || params[:commit].nil? || @prev_answers.include?(params[:commit])
    end

    def set_category
      @category = params[:category_id] \
                      ? Category.where(id: params[:category_id]).first \
                      : categories_of_type(Noun).first
    end
end
