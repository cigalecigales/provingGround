require 'flickraw'
require 'open-uri'

#
# 画像取得用クラス
#
class FlickrSearch
  FlickRaw.api_key = ''
  FlickRaw.shared_secret = ''

  # 画像を検索する
  def search_img(word, per_page, sort, upload_date)
    images = flickr.photos.search :tags => word, :sort => sort, :per_page => per_page, :min_upload_date => upload_date
  end

  # 画像を保存する
  def save_img(images = [])
    dir_name = "今日のセミ" + "(" + Time.now.strftime('%Y年%m月%d日%H時%M分%S秒') + ")"
    Dir::mkdir(dir_name) unless File.exist?(dir_name)

    images.each do |image|
      s_url = FlickRaw.url image
      file_name = File.basename(s_url)
      
      file_path = dir_name + '/' + file_name
      open(file_path, 'wb') do |output|
        open(s_url) do |data|
          output.write(data.read)
        end
      end
    end
  end
end

#
# 画像アップロード用クラス
#
class GoogleDriveUpload

end

#####################################################################################################################
word = "cicada" # 検索ワード
per_page = 100 # 画像取得数
sort = "date-posted-desc" # ソート順
upload_date = Time.now - 3*24*60*60 # 基準日

flickr_obj = FlickrSearch.new
images = flickr_obj.search_img(word, per_page, sort, upload_date)
flickr_obj.save_img(images)
#####################################################################################################################
