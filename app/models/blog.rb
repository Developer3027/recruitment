class Blog < ApplicationRecord

  extend FriendlyId

  friendly_id :title, use: :slugged
  # cover both create and upddate of blog
  before_save :parse_seo_keywords

  belongs_to :admin

  # A article can have a cover image
  has_one_attached :cover_image

  has_one_attached :seo_image

  has_rich_text :content

  # set up scopes for sorted, scheduled, published, and draft
  scope :sorted, -> { order(arel_table[:published_at].desc.nulls_last).order(updated_at: :desc) }
  scope :draft, -> { where(published_at: nil) }
  scope :published, -> { where("published_at <= ?", Time.current) }
  scope :scheduled, -> { where("published_at > ?", Time.current) }

  # helper methods for schduled, published, and draft
  def draft?
    published_at.nil?
  end

  def published?
    published_at? && published_at <= Time.current
  end

  def scheduled?
    published_at? && published_at > Time.current
  end

  def status
    draft? ? "Draft" : scheduled? ? "Scheduled" : published? ? "Published" : "Unknown"
  end



  private
  def parse_seo_keywords
    self.seo_keywords = self.seo_keywords.split(',').flatten.map(&:strip)
    puts "KEYWORDS: #{self.seo_keywords}"
  end

  def should_generate_new_friendly_id?
    title_changed? || slug.blank?
  end
end
