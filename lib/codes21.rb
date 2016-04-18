class Codes21
  def get_codes(path, suffixes)
    @items ||= []
    Dir.glob("#{path}/**/*.{#{suffixes}}").each do |file|
      title = file.split('/').last
      puts file

      puts '*' * 70
      codes = File.read(file)
      codes.squeeze! "\n"
      puts codes

      item = {title: title, codes: codes}
      @items << item
    end
    @items
  end

  def write_result(result_file_path)
    File.open(result_file_path, 'w') do |f|
      @items.each do |item|
        f.puts "File:" + item[:title]
        f.puts "Code:"
        f.puts item[:codes]
        f.puts "\n"
      end
    end

    puts '*' * 70
    puts "codes files count:  #{@items.size}"
  end

  def self.run(path, suffixes, result_file_path)
    codes21 = Codes21.new
    codes21.get_codes(path, suffixes)
    codes21.write_result(result_file_path)
  end

end
