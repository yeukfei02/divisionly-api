class ExpensesController < AuthApiController
  def create
    description = params['description']
    amount = params['amount']
    split_method = params['split_method']
    image = params['image']
    user_id = params['user_id']
    group_id = params['group_id']

    is_split_method_correct = false
    is_split_method_correct = true if Expense.expense_split_methods.has_value?(split_method)

    if is_split_method_correct
      expense = Expense.create!(description: description, amount: amount, split_method: split_method, image: image, user_id: user_id,
                               group_id: group_id)
      if expense.present?
        @message = 'createExpense'
        render :create, status: 200
      else
        @message = 'createExpense error'
        render :create, status: 400
      end
    else
      @message = 'createExpense error, wrong split_method'
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
