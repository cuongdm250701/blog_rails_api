class SaveNotifycationsWorker
    include Sidekiq::Worker
    queue_as :default

    def perform(title, content, user_id)
        # find followers
        followers = Follow
        .where(:followed_user_id => user_id)
        .where(:is_receive_notifycation => true)
        # get current user
        current_user = User.find(user_id)
        notifycations = []
        if followers.length > 0
            followers.each do |item|
                notifycation = Notifycation.new(
                    :title => title, 
                    :content => content,
                    :receiver_id => item.follower_by_user_id
                )
                notifycation.created_by = current_user
                notifycations << notifycation
            end
            Notifycation.import notifycations
        end
    end
end