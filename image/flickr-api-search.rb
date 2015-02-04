require 'flickraw'

FlickRaw.api_key = ''
FlickRaw.shared_secret = ''

# 検索ワード
tag = "cicada"

# tag: 			検索ワード。
# sort: 		ソート順。デフォルトは「date-posted-desc」。
# 					「relevance」は関連度の高さでソート。
# per_page: 検索した時の取得件数。デフォルトは100件。
images = flickr.photos.search(tags: tag, sort: "relevance", per_page: 10)

images.each do |image|
	info = flickr.photos.getInfo :photo_id => image.id, :secret => image.secret
	sizes = flickr.photos.getSizes :photo_id => image.id
	size_list = sizes.map{ |size| "横幅: #{ sizes.width } 縦幅: #{ sizes.height } }".join(", ") }

	puts "画像名: " + image.title
	puts "撮影日: " + info.dates.taken
	puts "投稿日: " + info.dates.posted
	size_list = sizes.map{ |size| "横幅: #{ size.width } 縦幅: #{ size.height }"}.join(", ")
	puts "出力可能サイズ: " + size_list
end


# 画像タイトルを表示
#images.each do |image|
#	puts image.title
#end

# 画像の撮影日を表示
# 「taken」を「posted」にすれば投稿日を取得
#images.each do |image|
#	info = flickr.photos.getInfo :photo_id => image.id, :secret => image.secret
#	puts info.dates.taken
#end

# 画像サイズを表示
#sizes = flickr.photos.getSizes :photo_id => images[0].id
#sizes.each do |size|
#	puts size.width
#	puts size.height
#end
