class CurrenciesController < AuthApiController
  def index
    @currencies = Currency.all

    @message = 'getCurrencies'
    render :index, status: :ok
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'getCurrencies error'
    @error = e.message.to_s
    render :index, status: :bad_request
  end
end
