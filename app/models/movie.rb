class Movie < ActiveRecord::Base
  
  has_many :reviews

  validates :title,
    presence: true

  validates :director,
    presence: true

  validates :runtime_in_minutes,
    numericality: { only_integer: true }

  validates :description,
    presence: true

  validates :poster_image_url,
    presence: true

  validates :release_date,
    presence: true

  validate :release_date_is_in_the_future

  mount_uploader :image, ImageUploader


  def review_average
    reviews.sum(:rating_out_of_ten)/reviews.size if reviews.size > 0 
  end
  
  protected

  def release_date_is_in_the_future
    if release_date.present?
      errors.add(:release_date, "should probably be in the future") if release_date < Date.today
    end
  end

  # private 

  #   def movies_params
  #     params.require(:movie).permit(:image,:name, :movie_id)
  #   end

end