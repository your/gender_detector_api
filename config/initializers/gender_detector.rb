require 'gender_detector'

DEFAULT_COUNTRY = :italy

class GenderDetector
  def get(*args)
    get_gender(*args)
  end
end

Gender = GenderDetector.new
