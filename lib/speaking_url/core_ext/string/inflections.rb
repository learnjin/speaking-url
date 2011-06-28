class String

  alias_method :original_downcase, :downcase
  alias_method :original_upcase, :upcase

  def upcase
    translations = [ ["ä", "Ä"], ["ö", "Ö"], ["ü", "Ü"], ["ß", "SS"] ]
    res = self.original_upcase
    translations.each do |f,t|
      res.gsub!(f,t)
    end
    res
  end

  def downcase
    translations = [ ["Ä", "ä"], ["Ö", "ö"], ["Ü", "ü"] ]
    res = self.original_downcase
    translations.each do |f,t|
      res.gsub!(f,t)
    end
    res
  end

  # Replaces all white space and special characters of a String with dashes, to make
  # it a valid url segment: 
  #
  #   "** Dr. Jekyll and Mr. Hyde ++" # => "Dr-Jekyll-and-Mr-Hyde"
  def urlify
    self.split(/\W+/).reject(&:blank?).join('-')
  end

  # Romanizes all German Umlaut characters
  #
  #   "Füße".unumlaut # => "Fuesse"
  def unumlaut
    res = self
    translations = [ ["Ä", "AE"], ["ä", "ae"], ["Ö", "OE"], ["ö", "oe"], ["Ü", "UE"], ["ü", "ue"], ["ß", "ss"] ]
    translations.each do |f,t|
      res.gsub!(f,t)
    end
    res
  end


end
