module QuizzesHelper
  def label_from(obj)
    @order == "en_to_de" ? obj.english : obj.german
  end

  def show_plural?
    !@noun.plural.blank? && @order == "de_to_en"
  end

  def show_literal?
  	!@sentence.literal_translation.blank? && @order == "en_to_de"
  end

  def translation_placeholder
  	"Translate to #{@order == 'en_to_de' ? 'German' : 'English'}"
  end

  def correct_answer(obj)
  	@order == "en_to_de" ? obj.german : obj.english
  end
end
