class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :comments, as: :commentable

  validates :body, :presence => true
end
