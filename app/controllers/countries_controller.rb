class CountriesController < AuthApiController
  def index
    @countries = Country.all

    @message = 'getCountries'
    render :index, status: 200
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'getCountries error'
    @error = e.message.to_s
    render :index, status: 400
  end
end
