class Record < ActiveRecord::Base
  acts_as_paranoid

  has_many :comments
  has_many :tags
  has_many :photos
  belongs_to :user
  accepts_nested_attributes_for :comments
  accepts_nested_attributes_for :tags
  accepts_nested_attributes_for :photos
end
