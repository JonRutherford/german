class QuizzesController < ApplicationController
  before_filter :hint
  before_filter :check_order, only: [:random_sentence, :random_noun]

  def random_sentence
    @sentence = Sentence.random
    respond_to do |format|
      format.html
      format.js
    end
  end 

  def random_noun
    @noun = Noun.random
    respond_to do |format|
      format.html
      format.js
    end
  end

  def der_die_das
    @definite_nominative_articles = ["der", "die", "das"]
    @noun = Noun.where(id: params[:noun_id]).first
    @correct = !@noun.nil? && @noun.article.nominative == params[:commit]
    @noun = Noun.random if @noun.nil? || @correct
    set_prev_answers
    respond_to do |format|
      format.html
      format.js
    end
  end

  def index
  end

  private
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
end
