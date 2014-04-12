module Member
  module ProfilesHelper
  	# Grabs text in the first paragraph and truncates it
    def truncate_to_paragraph(text)
      text = Nokogiri::HTML.parse(text).css('p').first.text
      truncate(text, length: 140)
    end
  end
end
