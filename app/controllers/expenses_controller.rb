class ExpensesController < AuthApiController
  def create; end

  def index
    @message = 'getExpenses'
    @expenses = Expense.all
    render :index, status: 200
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'getExpenses error'
    @error = e.message.to_s
    render :index, status: 400
  end

  def show; end
end
