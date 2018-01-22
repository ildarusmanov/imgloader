class LinkForm
  include ActiveModel::Model

  attr_accessor :url

  validates :url, presence: true
  validates :url, format: URI::regexp(%w(http https))
end
