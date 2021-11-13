class RemoveActivityWorker
  include Sidekiq::Worker

  def perform
    puts '### RemoveActivityWorker start ###'

    Activity.delete_all

    puts '### RemoveActivityWorker end ###'
  end
end

Sidekiq::Cron::Job.create(name: 'RemoveActivityWorker - every week', cron: '0 0 * * 0', class: 'RemoveActivityWorker')
