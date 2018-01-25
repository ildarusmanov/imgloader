class Image < ApplicationRecord
  belongs_to :sourcelink

  validates :source_url, presence: true
  validates :source_url, format: URI::regexp(%w(http https))
  validates :source_url, uniqueness: { scope: :sourcelink_id }
  validates :url, presence: true
  validates :url, format: URI::regexp(%w(http https))
  validates :sourcelink, presence: true 
end
