class Image < ActiveRecord::Base
    mount_uploader :file, ImageUploader
    default_scope -> {order(created_at: :desc)}
    validates :user_id, presence: true
    belongs_to :user
    has_many :image_comment, -> {order(created_at: :desc)}, dependent: :destroy
    
    def self.search(catergory, search)
        where("#{catergory} LIKE ?", "%#{search}%")
    end
end
