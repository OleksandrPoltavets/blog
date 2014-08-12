module ApplicationHelper

  #Date
  def date_text
    Rails.env.production? ? time = Time.now.localtime("+02:00") : time = Time.now
    date_today = "#{time.day}.#{time.month}.#{time.year}"
  end


end
