class FileCreatorWorker
  include Sidekiq::Worker

  def perform(file_path)
    FileCreator.new(file_path).generate
  end
end
