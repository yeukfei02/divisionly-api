class ExpensesController < AuthApiController
  include ApplicationHelper

  def create
    params.require(%i[description amount split_method user_id friend_id group_id expense_category_id
                      currency_id])
    permitted = params.permit(%i[description amount split_method user_id friend_id group_id
                                 expense_category_id currency_id])

    split_method = permitted['split_method']
    user_id = permitted['user_id']

    is_split_method_correct = false
    is_split_method_correct = true if Expense.expense_split_methods.has_value?(split_method)

    if is_split_method_correct
      expense = Expense.create!(permitted)
      if expense.present?
        user = User.find(user_id)
        ApplicationHelper.create_activity(user, user_id, 'created', 'expense')

        @message = 'createExpense'
        render :create, status: :ok
      else
        @message = 'createExpense error'
        render :create, status: :bad_request
      end
    else
      @message = 'createExpense error, wrong split_method'
      render :create, status: :bad_request
    end
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'createExpense error'
    @error = e.message.to_s
    render :create, status: :bad_request
  end

  def index
    params.require(:user_id)

    user_id = params['user_id']
    page = params['page']
    page_size = params['page_size']

    @expenses = []
    @expenses = Expense.where(user_id: user_id).order('created_at desc') if user_id.present?
    @expenses = @expenses.page(page.to_i).per(page_size.to_i) if page.present? && page_size.present?

    @total_count = @expenses.length

    @message = 'getExpenses'
    render :index, status: :ok
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'getExpenses error'
    @error = e.message.to_s
    render :index, status: :bad_request
  end

  def show
    @message = 'getExpenseById'
    @expense = Expense.find(params[:id])
    render :show, status: :ok
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'getExpenseById error'
    @error = e.message.to_s
    render :show, status: :bad_request
  end

  def update
    params.require(%i[description amount split_method user_id friend_id group_id expense_category_id
                      currency_id])
    permitted = params.permit(%i[description amount split_method user_id friend_id group_id
                                 expense_category_id currency_id])

    split_method = permitted['split_method']
    user_id = permitted['user_id']

    is_split_method_correct = false
    is_split_method_correct = true if Expense.expense_split_methods.has_value?(split_method)

    if is_split_method_correct
      expense = Expense.find(params[:id])
      if expense.present?
        expense.update!(permitted)

        user = User.find(user_id)
        ApplicationHelper.create_activity(user, user_id, 'updated', 'expense')

        @message = 'updateExpenseById'
        render :update, status: :ok
      else
        @message = 'updateExpenseById error, no this expense'
        render :update, status: :bad_request
      end
    else
      @message = 'updateExpenseById error, wrong split_method'
      render :update, status: :bad_request
    end
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'updateExpenseById error'
    @error = e.message.to_s
    render :update, status: :bad_request
  end

  def remove_expense
    params.require(%i[id user_id])

    expense = Expense.find(params[:id])
    if expense.present?
      expense.destroy

      user_id = params['user_id']
      user = User.find(user_id)
      ApplicationHelper.create_activity(user, user_id, 'removed', 'expense')

      @message = 'deleteExpenseById'
      render :remove_expense, status: :ok
    else
      @message = 'deleteExpenseById error, no this expense'
      render :remove_expense, status: :bad_request
    end
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'deleteExpenseById error'
    @error = e.message.to_s
    render :remove_expense, status: :bad_request
  end
end
