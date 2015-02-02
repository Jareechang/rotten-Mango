class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

  validates :user, :movie, :text, presence: true

  validates :rating_out_of_ten, numercality: {only_integer: true}
  validates :rating_out_of_ten, numercality: {greater_than_or_equal_to: 1}
  validates :rating_out_of_ten, numercality: {less_than_or_equal_to: 10}
end
