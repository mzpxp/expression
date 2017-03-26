class Micropost < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  
  has_many :likes, dependent: :destroy
  def like_user(user_id)
   likes.find_by(user_id: user_id)
  end

  def rank
    ranking = Micropost.all.collect do |micropost|
      micropost.likes.count
  end

    self_likes_count = self.likes.count

    high_rank_microposts = ranking.keep_if do |likes_count|
      likes_count > self_likes_count
    end

    return high_rank_microposts.count + 1
  end
  
  def self.top10
    ranking = Micropost.all.sort_by do |micropost|
      micropost.rank
    end

    ranking = ranking.keep_if do |micropost|
      micropost.rank <= 10
    end

    return ranking
  end

end
