require "nokogiri"
require "open-uri"


	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	all_prices_links = page.xpath('//a[@class="price"]')

	arrayprices = []

	i = 0

	all_symbols_links = page.xpath('//td[@class="text-left col-symbol"]')

	arraysymbol = []

	all_symbols_links.each do |symbol_link|
		arraysymbol << symbol_link.text
	    end

	all_prices_links.each do |price_link|
		arrayprices <<  price_link.text
	    end

	tableau = Hash[arraysymbol.zip arrayprices]

	print tableau