module TranslationsHelper
  def translation_keys(i18n_locale)
    case i18n_locale
    when "en"
      en_keys
    when "es"
      es_keys
    end
  end

	def translation_for_key(translations, key)
		hits = translations.to_a.select{ |t| t.key == key }
		hits.first
	end

  private

  def en_keys
    Translation.where(:locale => 'en').pluck(:key)
  end

  def es_keys
    Translation.where(:locale => 'es').pluck(:key)
  end
end
