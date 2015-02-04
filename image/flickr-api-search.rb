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

# 画像タイトルを表示
images.each do |image|
	puts image.title
end

# 画像の撮影日を表示
# 「taken」を「posted」にすれば投稿日を取得
images.each do |image|
	info = flickr.photos.getInfo :photo_id => image.id, :secret => image.secret
	puts info.dates.taken
end

# 画像サイズを表示
images.each do |image|
	sizes = flickr.photos.getSizes :photo_id => image.id
	sizes.each do |size|
		puts size.label
	end
end
