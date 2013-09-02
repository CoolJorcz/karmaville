class User < ActiveRecord::Base
  has_many :karma_points

  attr_accessible :first_name, :last_name, :email, :username, :karma_sum

  validates :first_name, :presence => true
  validates :last_name, :presence => true

  before_save :update_karma

  validates :username,
            :presence => true,
            :length => {:minimum => 2, :maximum => 32},
            :format => {:with => /^\w+$/},
            :uniqueness => {:case_sensitive => false}

  validates :email,
            :presence => true,
            :format => {:with => /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i},
            :uniqueness => {:case_sensitive => false}

  def self.by_karma
    self.order('karma_sum DESC')
  end

  def total_karma
    self.karma_sum
  end

  def update_karma
    self.karma_sum += self.karma_points.last
    user.save
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.page(number)
    number = 0 if number == nil
    limit(50).offset(number * 50)
  end
end
