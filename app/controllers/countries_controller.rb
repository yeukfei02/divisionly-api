class CountriesController < AuthApiController
  def index
    @countries = Country.all

    @message = 'getCountries'
    render :index, status: :ok
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'getCountries error'
    @error = e.message.to_s
    render :index, status: :bad_request
  end
end
