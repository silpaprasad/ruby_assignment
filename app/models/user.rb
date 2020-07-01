class User < ApplicationRecord
  validates :telephone, format: { with: /\A\(?\d{3}\)?[- ]?\d{3}[- ]?\d{4}\z/}, uniqueness: true
end
