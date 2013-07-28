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
end
