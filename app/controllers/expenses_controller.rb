class ExpensesController < AuthApiController
  def create
    description = params['description']
    amount = params['amount']
    split_method = params['split_method']
    user_id = params['user_id']
    group_id = params['group_id']

    expense = Expense.create(description: description, amount: amount, split_method: split_method, user_id: user_id,
                             group_id: group_id)
    if expense.present?
      @message = 'createExpense'
      render :create, status: 200
    else
      @message = 'createExpense error'
      render :create, status: 400
    end
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'createExpense error'
    @error = e.message.to_s
    render :create, status: 400
  end

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

  def show
    @message = 'getExpenseById'
    @expense = Expense.find(params[:id])
    render :show, status: 200
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'getExpenseById error'
    @error = e.message.to_s
    render :show, status: 400
  end
end
