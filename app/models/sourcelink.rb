class Sourcelink < ApplicationRecord
  has_many :images

  validates :url, presence: true
  validates :url, format: URI::regexp(%w(http https))
  validates :url, uniqueness: true
end
