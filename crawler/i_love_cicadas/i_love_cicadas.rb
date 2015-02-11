require 'flickraw'
require 'open-uri'
require 'google/api_client'
require 'google_drive'
require 'fileutils'

#
# 画像取得用クラス
#
class FlickrSearch
  FlickRaw.api_key = ''
  FlickRaw.shared_secret = ''

  # 画像を検索する
  def search_img(word, per_page, sort, upload_date)
    images = flickr.photos.search :text => word, :sort => sort, :per_page => per_page, :min_upload_date => upload_date
		return images
  end

	# ディレクトリを作成する
	def create_dir
    dir_name = "今日のセミ" + "(" + Time.now.strftime('%Y年%m月%d日%H時%M分%S秒') + ")"
    FileUtils.mkdir(dir_name) unless File.exist?(dir_name)
		return dir_name
	end

  # 画像を保存する
  def save_img(images = [], dir_name)
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

	# 画像情報をファイルに書き込む
	def save_log(images = [], dir_name)
		File.open("log.log", "a") do |file|
			file.puts("******************************" + dir_name + "***********************************")
		end
		images.each do |image|
			File.open("log.log", "a") do |file|
				file_url = (FlickRaw.url image).to_s
				file.puts(file_url)
			end
		end
	end
end

#
# 画像アップロード用クラス
#
class GoogleDriveUpload
	CLIENT_ID = ''
	CLIENT_SECRET = ''
	REFRESH_TOKEN = ''
	
	def upload_dir(dir_name, images = [])
		client = OAuth2::Client.new( 
			CLIENT_ID, CLIENT_SECRET,
			:site => "https://accounts.google.com",
			:token_url => "/o/oauth2/token",
			:authorize_url => "/o/oauth2/auth"
		)

		auth_token = OAuth2::AccessToken.from_hash(client, { :refresh_token => REFRESH_TOKEN, :expire_at => 3600 })
		auth_token = 	auth_token.refresh!

		session = GoogleDrive.login_with_oauth(auth_token.token)

		@folder = session.root_collection.create_subcollection(dir_name)

		dir = Dir.open(dir_name)
		dir.each do |image|
			if !(/^\.+$/ =~ image.to_s)
				puts image.to_s
				file = session.upload_from_file(dir_name + "/" + image.to_s, image.to_s, :convert => false)
				@folder.add(file)
				session.root_collection.remove(file)
			end
		end
		dir.close
	end
end

#####################################################################################################################
word = ["cicada", "蝉"] # 検索ワード
per_page = 100 # 画像取得数
sort = "date-posted-desc" # ソート順
upload_date = Time.now - 1*24*60*60 # 基準日

puts "検索ワード:" + word.map{ |tag| "#{ tag }" }.join(", ")
puts "基準日:" + upload_date.to_s

puts "******************* 画像取得スタート **********************"
flickr_obj = FlickrSearch.new

@images = []
word.each do |wd|
	search_images = flickr_obj.search_img(wd, per_page, sort, upload_date)
	search_images.each do |si|
		@images.push(si)
	end
end
dir_name = flickr_obj.create_dir

puts "ディレクトリ名:" + dir_name
puts "画像数:" + @images.size.to_s

if @images.size != 0
	flickr_obj.save_img(@images, dir_name)
	puts "********************* 画像取得完了*************************"

	puts "**************** 画像アップロードスタート *****************"
	google_obj = GoogleDriveUpload.new
	google_obj.upload_dir(dir_name)
	puts "****************** 画像アップロード完了 *******************"
end

FileUtils.rm_r(dir_name)
puts "****************** ディレクトリ削除完了 *******************"
flickr_obj.save_log(@images, dir_name)
#####################################################################################################################
