namespace :db do
  desc "calculate user karma points"
  task :karma => :environment do
      User.all.size.times do |i|
        user = User.find(i + 1)
        user.total_karma = KarmaPoint.where(user_id: user.id).pluck(:value).reduce(:+)
        user.save(:validate => false)
      end
  end
end
