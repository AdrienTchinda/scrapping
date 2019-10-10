require "nokogiri"
require "open-uri"

			pageb = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
			all_emailsb_links = pageb.xpath('//a[@class="lientxt"]')

			emailsa = []

			emailsb = []

			all_emailsb_links.each do |emailb_link|			
				emailsb << emailb_link['href'].gsub("./", 'https://www.annuaire-des-mairies.com/')
				pagea = Nokogiri::HTML(open(emailb_link['href'].gsub("./", 'https://www.annuaire-des-mairies.com/')))
			
				all_emailsa_links = pagea.xpath('//html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')

				all_emailsa_links.each do |emaila_link|
				
					emailsa << all_emailsa_links.text

				end

			end

			names = []


			all_emailsb_links.each do |emailb_link|			
				names << emailb_link.text
			end


		    email = Hash[names.zip emailsa]

	print email