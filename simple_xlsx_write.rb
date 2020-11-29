require 'rubygems'
  require 'simple_xlsx'

  SimpleXlsx::Serializer.new("test.xlsx") do |doc|
    doc.add_sheet("People") do |sheet|
      sheet.add_row(%w{DoB Name Occupation})
      sheet.add_row([Date.parse("July 31, 1912"),
                     "Milton Friedman",
                     "Economist / Statistician"])
    end
  end
