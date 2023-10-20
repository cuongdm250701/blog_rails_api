class Notifycation < ApplicationRecord
    belongs_to :created_by, :class_name => "User"
    belongs_to :receiver, :class_name => "User"
end
