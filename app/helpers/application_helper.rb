module ApplicationHelper
  def top_five_users
    #TODO  - need to work on top 5
    top5_query = "select user_rate from top_users_ranks"
    records_array = ActiveRecord::Base.connection.execute(top5_query)
    gogo_array = Array.new
    records_array.each do |record|
      gogo_array << record.to_s.sub('"user_rate"=>0.54, 0=>' , 'user scored: ')
    end
    return gogo_array
    #return records_array[1].to_s.sub('"user_rate"=>0.54, 0=>' , 'user scored: ')
  end

end
