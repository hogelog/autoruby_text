# AutorubyText

Automatic ruby furigana tool.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add autoruby_text

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install autoruby_text

## Usage

```console
$ cat text
メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと決意した。メロスには政治がわからぬ。メロスは、村の牧人である。笛を吹き、羊と遊んで暮して来た。けれども邪悪に対しては、人一倍に敏感であった。
$ autoruby-text text
<html>
<style>
  div {
    font-family: "游ゴシック体", YuGothic, "YuGothic M", sans-serif;
    font-size: 20px;
    line-height: 35px;
  }
</style>
<body>
  <div>メロスは<ruby>激怒<rt>げきど</rt></ruby>した。<ruby>必<rt>かなら</rt></ruby>ず、かの<ruby>邪智<rt>じゃち</rt></ruby><ruby>暴虐<rt>ぼうぎゃく</rt></ruby>の<ruby>王<rt>おう</rt></ruby>を<ruby>除<rt>のぞ</rt></ruby>かなければならぬと<ruby>決意<rt>けつい</rt></ruby>した。メロスには<ruby>政治<rt>せいじ</rt></ruby>がわからぬ。メロスは、<ruby>村<rt>むら</rt></ruby>の<ruby>牧人<rt>ぼくじん</rt></ruby>である。<ruby>笛<rt>ふえ</rt></ruby>を<ruby>吹<rt>ふ</rt></ruby>き、<ruby>羊<rt>ひつじ</rt></ruby>と<ruby>遊<rt>あそ</rt></ruby>んで<ruby>暮<rt>くら</rt></ruby>して<ruby>来<rt>き</rt></ruby>た。けれども<ruby>邪悪<rt>じゃあく</rt></ruby><ruby>に対<rt>にたい</rt></ruby>しては、<ruby>人一倍<rt>ひといちばい</rt></ruby>に<ruby>敏感<rt>びんかん</rt></ruby>であった。</div>
</body>
</html>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/hogelog/autoruby_text>.
