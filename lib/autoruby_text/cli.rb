module AutorubyText
  class CLI
    def self.run
      html = Converter.new.run(ARGF.read)
      puts(html)
    end
  end
end
