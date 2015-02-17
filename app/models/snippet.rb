class Snippet < ActiveRecord::Base

  include Flagging

  belongs_to :user

  has_many :stories
  has_many :flags, as: :flaggable

  validates_presence_of :content, :on => :update

  searchable do
    text :content
  end

  def self.most_recent
    Snippet.all.sort_by(&:created_at).reverse.take(5)
  end

  def stories_count
    self.stories.count
  end

  def self.most_popular
    snippets = Snippet.all.sort_by(&:stories_count).reverse.take(5)
    snippets.map { |snippet| {snippet => snippet.stories_count} }
  end

  def self.random
    Snippet.all.shuffle
  end

  def self.flagged
    Snippet.all.where(flagged: true)
  end

  def remove_dangerous_html_tags!
    Sanitize.fragment(self, Sanitize::Config::RESTRICTED)
  end

end
