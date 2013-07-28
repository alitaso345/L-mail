#encoding:utf-8
#メールの本文を作成するクラス

class MailMain

       def initialize(address = @address)
               @sendTo = address
               @sendSub = "おはようございます"
               @sendText = ""
       end

       def sendTo
               return @sendTo
       end

       def sub
               return @sendSub
       end

        def text(fullSchedule)
                day = Time.now

                l_message = <<-EOS
alice345さん，おはようございます

今日(#{day.strftime("%m月%d日")})のご予定をお知らせしますね
#{fullSchedule}
今日も1日頑張りましょう！
EOS

                @sendText = l_message

                return @sendText
        end
end
