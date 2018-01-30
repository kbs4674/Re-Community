class Home < ApplicationRecord
    has_many :posts
    has_many :qnas
    has_many :comments
    has_many :comment_qnas
end
