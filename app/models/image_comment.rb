class ImageComment < ActiveRecord::Base
    belongs_to :image
    belongs_to :user
    validates :comment, presence: true, length: { maximum: 140}
end
