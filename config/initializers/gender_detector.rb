require 'gender_detector'

DEFAULT_COUNTRY   = :italy
ALLOWED_COUNTRIES = GenderDetector::COUNTRIES

class GenderDetector
  FALLBACK_GENDER = 'f'

  def get(*args)
    case get_gender(*args)
      when :male then 'm'
      when :female then 'f'
      else FALLBACK_GENDER
    end
  end
end

Gender = GenderDetector.new
