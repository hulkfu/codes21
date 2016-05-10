class Codes21
  def get_codes(path, suffixes, coding="UTF-8")
    @items ||= []
    Dir.glob("#{path}/**/*.{#{suffixes}}").each do |file|
      title = file.split('/').last.force_encoding(coding)
      puts file

      puts '*' * 70
      codes = File.read(file).force_encoding(coding)
      # sb的软件著作权要求不能有空行
      codes = codes.squeeze("\n")
      puts codes

      item = {title: title, codes: codes}
      @items << item
    end
    @items
  end

  def write_result(result_file_path, coding="UTF-8")
    File.open(result_file_path, 'w') do |f|
      @items.each do |item|
        title = "File:" + item[:title]
        code_label = "Code:"
        codes = item[:codes]

        content = title + "\n" + code_label + "\n" + codes + "\n"

        f.print content.encode(coding)
      end
    end

    puts '*' * 70
    puts "codes files count:  #{@items.size}"
  end

  def self.run(path, suffixes, result_file_path, input_coding="UTF-8", output_coding="UTF-8")
    codes21 = Codes21.new
    codes21.get_codes(path, suffixes, input_coding)
    codes21.write_result(result_file_path, output_coding)
  end

end
