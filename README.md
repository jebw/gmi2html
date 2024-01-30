# Gmi2html

This is a pure ruby Gemtext to HTML convertor, relying on the gemtext gem

## Gemini

Gemtext is a simple plain text format, similar to Markdown but simpler. It is the official format for pages within Gemini capsules.

For more information on Gemini see the official page

[Gemini official page](//gemini.circumlunar.space)
[Gemini specification](//gemini.circumlunar.space/docs/specification.gmi)

I've written a separate gem - [jekyll-gemini](https://github.com/jebw/jekyll-gemini) which uses this gem for publishing from your Jekyll blog to a Gemini capsule. 

## Using Gmi2html

To convert a Gemtext string to an html string

```ruby
require 'gmi2html'

html_string = Gmi2html::Document.new(my_gemtext_string).to_html
```

To convert a Gemtext file to an html string

```ruby
require 'gmi2html'

html_string = File.open('capsule/my_gemtext.gmi', 'r') do |f|
  Gmi2html::Document.new(f).to_html
end
```

There is also a command line tool called `gmi2html`.
Please refer to the help message (`gmi2html --help`) for its usage.

## Status

Second release but should be feature complete

### Supported

* Paragraphs
* Headings
* Quotes
* Whitespace
* List items
* Preformatted text
* Syntax highlighted preformatted text
