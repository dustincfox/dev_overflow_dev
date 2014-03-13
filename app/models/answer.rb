class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :comments, as: :commentable
  acts_as_votable

  validates :body, :presence => true
end
