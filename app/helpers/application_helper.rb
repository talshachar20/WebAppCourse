module ApplicationHelper
  def top_three_users
    #TODO  - need to work on top 5
    top5_query = "select user_rate from top_users_ranks"
    records_array = ActiveRecord::Base.connection.execute(top5_query)
    gogo_array = []
    records_array.each do |record|
      gogo_array << 'User score: ' + record[0].to_s
    end
    return gogo_array[0], gogo_array[1], gogo_array[2]
  end
end
