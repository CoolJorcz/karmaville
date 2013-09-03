class User < ActiveRecord::Base
  has_many :karma_points
  scope :page, ->(number) { number ||= 0;
                           limit(100).offset(number * 100) }

  attr_accessible :first_name, :last_name, :email, :username, :karma_sum

  validates :first_name, :presence => true
  validates :last_name, :presence => true

  after_save :update_karma

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
    self.karma_sum = self.karma_points.sum(:value)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  # def self.page(number)
  #   number ||= 0
  #   limit(100).offset(number * 100) 
  # end
end
