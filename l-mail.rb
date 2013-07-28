#encoding:utf-8


require 'gmail'
load './googlecalender.rb'
load './mail_main.rb'

gmail = Gmail.new(@username,@password)
day = Time.now.day

fullSchedule = ""

#予定の内容を確認
fullSchedule += Google_calendar()

eruSerif = MailMain.new(@address)

#メールの送信
email = gmail.generate_message do
        to eruSerif.sendTo  
        subject eruSerif.sub 
        body eruSerif.text(fullSchedule) 
        add_file "./image/#{day%10}.jpg"
end

gmail.deliver(email)
