namespace :db do
  desc "calculate user karma points"
  task :karma => :environment do
      User.all.each do |user|
        user.total_karma = KarmaPoint.where(user_id: user.id).pluck(:value).reduce(:+)
        user.save(:validate => false)
      end
  end
end
