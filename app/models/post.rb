class Post < ApplicationRecord
  # All the post go to one user
  belongs_to :user
  has_many :comments
end
