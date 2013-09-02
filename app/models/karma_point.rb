class KarmaPoint < ActiveRecord::Base
  attr_accessible :user_id, :label, :value
  belongs_to :user

  validates :user, :presence => true
  validates :value, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
  validates :label, :presence => true

  before_save :update_karma_points

  def update_karma_points
    user = User.find(self.user_id)
    user.karma_sum += self.value
    user.save
  end
end
