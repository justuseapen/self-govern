class ArchiveWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  # recurrence { daily }

  def perform
    # code
  end
end
