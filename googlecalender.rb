#encoding:utf-8
require 'gcalapi'
load './userdata.rb'

#カレンダーから当日の予定のタイトルだけを取り出す
def Google_calendar
        today_sc=""
        sc_count=0
        feed = "http://www.google.com/calendar/feeds/konatu345%40gmail.com/private/full"

        srv = GoogleCalendar::Service.new(@username,@password)
        cal = GoogleCalendar::Calendar::new(srv,feed)
        allevents = cal.events
       
                allevents.each do |event|
                if event.st.to_s.slice(0..9) == Date.today.to_s.slice(0..9)
                        today_sc += "・" + event.title + "\n"
                        sc_count += 1
                end
        end

        if sc_count>0
                today_sc = "本日の予定は\n" + today_sc + "です\n"
                return today_sc
        else
                today_sc = "本日は予定が入っておりません"
        end
end
