class OverallController < AuthApiController
  def get_total_owe_amount
    params.require(:user_id)

    user_id = params['user_id']

    @expenses = []
    @expenses = Expense.where(user_id: user_id).order('created_at desc') if user_id.present?

    total_owe_amount_list = []
    total_owe_amount = 0
    @expenses.each do |expense|
      split_method = expense.split_method
      next unless %w[you_paid_and_split_equally friend_paid_and_split_equally].include?(split_method)

      obj = {}

      owe_amount = (expense.amount / 2).round(2)
      currency = expense.currency

      total_owe_amount += owe_amount

      obj['owe_amount'] = owe_amount
      obj['currency_code'] = currency.code
      obj['currency_name'] = currency.name
      total_owe_amount_list.push(obj)
    end

    @message = 'getTotalOweAmount'
    @total_owe_amount_list = total_owe_amount_list
    @total_owe_amount = total_owe_amount
    render :get_total_owe_amount, status: :ok
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'getTotalOweAmount error'
    @error = e.message.to_s
    render :get_total_owe_amount, status: :bad_request
  end
end
