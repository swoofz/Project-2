class User < ApplicationRecord
  # make it so you can't see the password
  has_secure_password
  # link the posts to a user
  has_many :posts
  # Let users be able to see their posts on their pages
  accepts_nested_attributes_for :posts,
  # can delete posts
  allow_destroy: true,
  # No post will be able to post without and title and a body/description
  reject_if:lambda {|attr| attr[:title].blank? or attr[:body].blank?}
end
