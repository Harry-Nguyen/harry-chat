class Friendship < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  belongs_to :friend, class_name: 'User'
end
