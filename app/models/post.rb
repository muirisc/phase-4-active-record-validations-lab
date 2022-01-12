class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}

  validate :click_bait?

  VIABLE_TITLES = [/Won't Believe/i, /Secret/i, /Top \d/i, /Guess/i]
  
  def click_bait?
  if VIABLE_TITLES.none? {|pat| pat.match title}
      errors.add(:title, "Not clickbait-y enough")
    end
  end
end
