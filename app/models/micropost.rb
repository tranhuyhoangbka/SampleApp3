class Micropost < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { minimum: 10 }
  validate :picture_size
  mount_uploader :picture, PictureUploader


  private

  def picture_size
  	if picture.size > 5.megabytes
  		errors.add(:picture, "should be less 5 Mb")
  	end
  end
end
