class RemoveActivityWorker
  include Sidekiq::Worker

  def perform
    puts "### RemoveActivityWorker start ###"

    Activity.delete_all

    puts "### RemoveActivityWorker end ###"
  end
end
