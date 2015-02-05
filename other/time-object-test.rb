day = Time.now

# 2015-01-31 21:41:51 +900
puts day

# JST･･･Japan Standard Time
puts day.zone

# 2015-01-31 12:45:57 UTC
puts day.getutc

puts day.year
puts day.month
puts day.day
puts day.hour
puts day.min
puts day.sec
# ナノ秒を整数で
puts day.nsec
# 月: 1, 土: 6 , 日: 0
puts day.wday
# 1/1からの経過日数
puts day.yday

time1 = Time.now
time2 = Time.now

# false
puts time1 == time2

time3 = Time.now
# 秒数に足したり引いたり
puts time3 + 1
puts time3 - 1

time4 = Time.at(0)
# 1970-01-01 09:00:00 +0900
puts time4
puts Time.at(1234567)

args1 = Time.now.to_a
# 秒　分　時　日　月　年　曜日　通算日数　夏時間かどうか　タイムゾーン
# [49, 59, 21, 31, 1, 2015, 6, 31, false, JST]
puts args1

time5 = Time.now
puts time5.strftime('%Y/%m/%d %H:%M:%S')
