namespace :db do
  desc "calculate user karma points"
  task :karma => :environment do
    #ruby code
  User.transaction do
    User.all.each do |user|
      user.karma_points.sum(:value)
    end
  end
end
end

#Get all users, 
#FROM 'karma_points' WHERE 'karma_points'.'user_id' = #{user.id}
