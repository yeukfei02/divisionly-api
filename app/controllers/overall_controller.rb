class OverallController < AuthApiController
  def get_total_owe_amount
    user_id = params['user_id']

    @expenses = []
    @expenses = Expense.where(user_id: user_id).order('created_at desc') if user_id.present?

    total_owe_amount_list = []
    total_owe_amount = 0
    @expenses.each do |expense|
      if expense.split_method == 'you_paid_and_split_equally' || expense.split_method == 'friend_paid_and_split_equally'
        obj = {}

        owe_amount = expense.amount / 2
        currency = expense.currency

        total_owe_amount += owe_amount.round(2)

        obj['owe_amount'] = owe_amount.round(2)
        obj['currency_code'] = currency.code
        obj['currency_name'] = currency.name
        total_owe_amount_list.push(obj)
      end
    end

    @message = 'getTotalOweAmount'
    @total_owe_amount_list = total_owe_amount_list
    @total_owe_amount = total_owe_amount
    render :get_total_owe_amount, status: 200
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'getTotalOweAmount error'
    @error = e.message.to_s
    render :get_total_owe_amount, status: 400
  end
end
