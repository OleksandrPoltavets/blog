desc "Fetch pictures"
task :fetch_pictures => :environment do
  require 'rubygems'

  url_files = Dir.glob("public/urls/*")
  url_files.each do |f|
    @urls = []
    File.open("#{f}").readlines.each do |line|
      item = line.gsub(/[",\n\s]/, "")
      @urls.push(item)
    end
    if @urls.first == "[" and @urls.last == "]"
      @urls.pop
      @urls.shift
    end

    @name = @urls.pop

    FileUtils.mkdir_p("public/#{@name}")
    @urls.each_with_index do |url, index|
      name = url.split("/")[6]
      command = "curl -o public/#{@name}/#{index+1}_#{name}.jpg #{url}"
      system(command)
    end
  end

end