class ExpenseCategoriesController < AuthApiController
  def index
    @expense_categories = ExpenseCategory.all.group_by(&:expense_category_group)

    @message = 'getExpenseCategories'
    render :index, status: :ok
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'getExpenseCategories error'
    @error = e.message.to_s
    render :index, status: :bad_request
  end
end
