require "natto"

module AutorubyText
  class Converter
    def initialize
      @natto = Natto::MeCab.new
    end

    def run(text)
      lines = text.lines.map(&:chomp).map{|line| parse_line(line) }
      body_html = lines.map{|words|
        words.map{|word, furigana|
          if furigana
            "<ruby>#{word}<rt>#{furigana}</rt></ruby>"
          elsif word.match?(/[[:ascii:]]$/)
            word + " "
          else
            word
          end
        }.join
      }.join("<br />\n")
      <<~HTML
        <html>
        <style>
          div {
            font-family: "游ゴシック体", YuGothic, "YuGothic M", sans-serif;
            font-size: 20px;
            line-height: 35px;
          }
        </style>
        <body>
          <div>#{ body_html }</div>
        </body>
        </html>
      HTML
    end

    def parse_line(line)
      words = []
      result = @natto.parse(line).lines.map{ _1.chomp.split("\t") unless _1 == "EOS\n" }.compact
      result.each {|word, features|
        word_katakana = word.tr("ぁ-ん", "ァ-ン")
        furigana = features.split(",")[7]
        if [word, word_katakana].include?(furigana) || !furigana
          words << [word, nil]
        else
          furigana_hiragana = furigana.tr("ァ-ン", "ぁ-ん")
          okurigana = []
          pos = -1
          while word[pos] == furigana_hiragana[pos]
            okurigana.unshift(word[pos])
            pos -= 1
          end
          words << [word[0..pos], furigana_hiragana[0..pos]]
          words << [okurigana.join, nil]
        end
      }
      words
    end
  end
end
