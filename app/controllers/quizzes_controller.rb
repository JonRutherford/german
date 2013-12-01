class QuizzesController < ApplicationController
  before_filter :signed_in_user
  before_filter :hint
  before_filter :check_order, only: [:random_sentence, :translate_noun]
  before_filter :current_noun, only: [:der_die_das, :translate_noun, :plural]

  def random_sentence
    @sentence = Sentence.random
    respond_to do |format|
      format.html
      format.js
    end
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
    @noun = Noun.random if @noun.nil? || @correct
    set_prev_answers
    respond_to do |format|
      format.html
      format.js
    end
  end

  def plural
    @correct = !@noun.nil? && @noun.plural = params[:plural]
    @noun = Noun.random if @noun.nil? || @correct
    respond_to do |format|
      format.html
    end
  end

  def index
  end

  private
    def current_noun
      @noun = Noun.where(id: params[:noun_id]).first
    end

    def hint
      redirect_to :index if params[:commit] == "Hint"
    end

    def check_order

      print "SFSAHFSAJF #{params[:order]}"

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
end
