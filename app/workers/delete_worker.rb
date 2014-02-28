class DeleteWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { daily }

  def perform
    Prompt.all.each do |prompt|
      prompt.destroy if prompt.is_deletable?
    end
  end
end
