module LessonsHelper
    def nl2br(text)
       text.gsub(/\n/, '<br/>')
   end
end
