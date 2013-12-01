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

  def from_lang
    @order == "en_to_de" ? "english" : "german"
  end

  def to_lang
    @order == "en_to_de" ? "german" : "english"
  end

  def correct_answer(obj)
  	@order == "en_to_de" ? obj.german : obj.english
  end

  def categories_of_type(type)
    Category.includes(:categorisations).where(categorisations: { sentence_part_type: type })
  end
end
