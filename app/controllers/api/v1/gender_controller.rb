class Api::V1::GenderController < ApplicationController
  def recognize
    @results = _genderize(_gender_params)
    rescue ActionController::ParameterMissing
      render nothing: true, status: 400
  end

  private
    def _genderize(data)
      {
        country: data[:country],
        list:    data[:list].map do |name|
                   [name, Gender.get(name, data[:country].to_sym)]
                 end
      }
    end

    def _gender_params
      params.require(:names).permit(:country, :list => []).tap do |name_params|
        unless ALLOWED_COUNTRIES.include?(name_params[:country].try(:to_sym))
          name_params[:country] = DEFAULT_COUNTRY
        end
        name_params.require(:country)
        name_params.require(:list)
      end
    end
end
