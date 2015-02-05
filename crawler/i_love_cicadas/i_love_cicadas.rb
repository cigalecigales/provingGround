require 'flickraw'

FlickRaw.api_key = ''
FlickRaw.shared_secret = ''

word = "cicada" # 検索ワード
per_page = 100 # 画像取得数
sort = "date-posted-desc" # ソート順
upload_date = Time.now - 1*24*60*60 # 基準日
puts upload_date

#
# 画像を検索する
#
def search_img(word, per_page, sort, upload_date)
	images = flickr.photos.search :tags => word, :sort => sort, :per_page => per_page, :min_upload_date => upload_date
	puts images.size
	images.each do |image|
		info = flickr.photos.getInfo :photo_id => image.id
		puts Time.at(info.dates.posted.to_i).to_s
	end
end

#
# 画像を保存する
#
def save_img(urls = [])
	dir_name = "今日のセミ" + "(" + Time.now.strftime('%Y年%m月%d日%H時%M分%S秒') + ")"
	Dir::mkdir(dir_name) unless File.exist?(dir_name)
end



search_img(word, per_page, sort, upload_date)
