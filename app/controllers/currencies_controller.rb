class CurrenciesController < AuthApiController
  def index
    @currencies = Currency.all

    @message = 'getCurrencies'
    render :index, status: 200
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'getCurrencies error'
    @error = e.message.to_s
    render :index, status: 400
  end
end
