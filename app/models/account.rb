class Account < ApplicationRecord
  belongs_to :user
  has_many :users
  validates :name, presence: true
end
