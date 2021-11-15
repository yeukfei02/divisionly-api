class ExpensesController < AuthApiController
  include ApplicationHelper

  def create
    description = params['description']
    amount = params['amount']
    split_method = params['split_method']
    image = params['image']
    user_id = params['user_id']
    friend_id = params['friend_id']
    group_id = params['group_id']
    expense_category_id = params['expense_category_id']
    currency_id = params['currency_id']

    is_split_method_correct = false
    is_split_method_correct = true if Expense.expense_split_methods.has_value?(split_method)

    if is_split_method_correct
      expense = Expense.create!(description: description, amount: amount.to_f, split_method: split_method, image: image, user_id: user_id,
                                friend_id: friend_id, group_id: group_id, expense_category_id: expense_category_id,
                                currency_id: currency_id)
      if expense.present?
        user = User.find(user_id)
        ApplicationHelper.create_activity(user, user_id, 'created', 'expense')

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
    user_id = params['user_id']
    page = params['page']
    page_size = params['page_size']

    @expenses = []
    @expenses = Expense.where(user_id: user_id).order('created_at desc') if user_id.present?
    if page.present? && page_size.present?
      @expenses = @expenses.page(page.to_i).per(page_size.to_i)
    end

    @total_count = @expenses.length

    @message = 'getExpenses'
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

  def update
    description = params['description']
    amount = params['amount']
    split_method = params['split_method']
    user_id = params['user_id']
    image = params['image']

    is_split_method_correct = false
    is_split_method_correct = true if Expense.expense_split_methods.has_value?(split_method)

    if is_split_method_correct
      expense = Expense.find(params[:id])
      if expense.present?
        expense.update!(description: description, amount: amount.to_f, split_method: split_method, image: image)

        user = User.find(user_id)
        ApplicationHelper.create_activity(user, user_id, 'updated', 'expense')

        @message = 'updateExpenseById'
        render :update, status: 200
      else
        @message = 'updateExpenseById error, no this expense'
        render :update, status: 400
      end
    else
      @message = 'updateExpenseById error, wrong split_method'
      render :update, status: 400
    end
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'updateExpenseById error'
    @error = e.message.to_s
    render :update, status: 400
  end

  def remove_expense
    expense = Expense.find(params[:id])
    if expense.present?
      expense.destroy

      user_id = params['user_id']
      user = User.find(user_id)
      ApplicationHelper.create_activity(user, user_id, 'removed', 'expense')

      @message = 'deleteExpenseById'
      render :remove_expense, status: 200
    else
      @message = 'deleteExpenseById error, no this expense'
      render :remove_expense, status: 400
    end
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'deleteExpenseById error'
    @error = e.message.to_s
    render :remove_expense, status: 400
  end
end
