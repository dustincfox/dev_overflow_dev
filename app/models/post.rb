class Post < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :tags
  acts_as_votable
end
