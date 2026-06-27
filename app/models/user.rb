class User < ApplicationRecord
  has_prefix_id :u
  has_secure_password
  has_many :sessions, dependent: :destroy

  belongs_to :account, optional: true, autosave: true

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  validates :email_address, presence: true, uniqueness: true
  validates :name, presence: true
end
