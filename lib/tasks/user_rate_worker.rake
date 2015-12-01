namespace :user_rate_worker do
  task :rate_users => :environment do
    counters = (Results.select("user_id , SUM(CASE is_correct WHEN 1 THEN 1 ELSE 0 END) AS answers_correct",
                               'SUM(CASE is_correct WHEN 0 THEN 1 ELSE 0 END) AS answers_wrong').group('user_id'))
    counters.each do |counter|
      puts "user: " + counter.user_id.to_s + " correct:"  + counter.answers_correct.to_s + " wrong:" + counter.answers_wrong.to_s
      unless counter.answers_correct < 1 or counter.answers_wrong < 1
        rate_for_user = (counter.answers_correct.to_f / (counter.answers_wrong.to_f + counter.answers_correct.to_f)).round(2) * 1000
        puts rate_for_user
        User.where(id: counter.user_id).update_all(user_rate: rate_for_user)
      end
    end
  end
end
