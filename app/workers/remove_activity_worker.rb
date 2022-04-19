# frozen_string_literal: true

class RemoveActivityWorker
  include Sidekiq::Worker

  def perform
    Rails.logger.debug '### RemoveActivityWorker start ###'

    Activity.delete_all

    Rails.logger.debug '### RemoveActivityWorker end ###'
  end
end

Sidekiq::Cron::Job.create(name: 'RemoveActivityWorker - every week', cron: '0 0 * * 0', class: 'RemoveActivityWorker')
