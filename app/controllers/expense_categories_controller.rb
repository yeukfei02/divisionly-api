class ExpenseCategoriesController < AuthApiController
  def index
    @expense_categories = ExpenseCategory.all.group_by(&:expense_category_group)

    @message = 'getExpenseCategories'
    render :index, status: 200
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'getExpenseCategories error'
    @error = e.message.to_s
    render :index, status: 400
  end
end
