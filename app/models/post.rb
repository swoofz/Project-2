class Post < ApplicationRecord
  # All the post go to one user 
  belongs_to :user
end
