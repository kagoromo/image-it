class Image < ActiveRecord::Base
    mount_uploader :file, ImageUploader
    default_scope -> {order(created_at: :desc)}
    validates :user_id, presence: true
    validates :name, presence: true, length: { maximum: 50 }
    belongs_to :user
    has_many :image_comment, -> {order(created_at: :desc)}, dependent: :destroy
    acts_as_votable
    
    def self.search(catergory, search)
        where("#{catergory} LIKE ?", "%#{search}%")
    end
end
