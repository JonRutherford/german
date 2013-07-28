module SentencesHelper
  def sentence_title(sentence)
	sentence.german + (sentence.literal_translation.blank? ? "" : "(#{sentence.literal_translation})")
  end
end
