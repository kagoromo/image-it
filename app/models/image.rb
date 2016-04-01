class Image < ActiveRecord::Base
    mount_uploader :file, ImageUploader
    default_scope -> {order(created_at: :desc)}
    validates :user_id, presence: true
    belongs_to :user
end
