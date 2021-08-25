module ApplicationHelper
  def minutes_in_words(timestamp)
    minutes = (((Time.now - timestamp).abs)/60).round

    return nil if minutes < 0

    case minutes
      when 0..4            then '5分前'
      when 5..14           then '15分前'
      when 15..29          then '30分前'
      when 30..59          then '30分前'
      when 60..119         then '1時間前'
      when 120..239        then '2時間前'
      when 240..479        then '4時間前'
      when 480..719        then '8時間前'
      when 720..1439       then '12時間前'
      when 1440..11519     then '&gt; ' << pluralize((minutes/1440).floor, '日前')
      when 11520..43199    then '&gt; ' << pluralize((minutes/11520).floor, '週間前')
      when 43200..525599   then '&gt; ' << pluralize((minutes/43200).floor, 'ヶ月前')
      else                      '&gt; ' << pluralize((minutes/525600).floor, '年前')
    end
  end
end
