class TestWorker
    include Sidekiq::Worker
    queue_as :default

    def perform()
        # binding.pry
        p "Hello worker on #{Time.now().strftime('%F - %H:%M:%S.%L')}"
    end
end