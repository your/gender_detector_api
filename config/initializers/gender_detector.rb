require 'gender_detector'

# Choose these only:
DEFAULT_COUNTRY   = :italy
FALLBACK_GENDER   = 'f'

# No further config required.
ALLOWED_COUNTRIES = GenderDetector::COUNTRIES

class GenderDetector
  def get(*args)
    case get_gender(*args)
      when :male then 'm'
      when :female then 'f'
      else FALLBACK_GENDER
    end
  end
end

Gender = GenderDetector.new
