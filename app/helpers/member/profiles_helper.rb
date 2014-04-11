module Member
  module ProfilesHelper
    def truncate_to_paragraph(text)
      Nokogiri::HTML.parse(text).css('p').first.text
    end
  end
end
