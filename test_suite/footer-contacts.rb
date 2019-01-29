require '../master.rb'

begin    
  @test_name = "footer-contacts-validations"
  url = ARGV[0] || "https://www.creditcards.com"
  
  browser = get_browser[rand(get_browser.length)]
  contacts = [ "Customer Support", "Partnership Opportunities", "Business Development", "Media Relations", "Contact Us"]

  @selenium = Selenium::WebDriver.for browser.to_sym
  
  open(url)
  
  contacts.each do |contact|  
    contact_link = find_by(:link_text, contact).attribute('href')
    http_response(contact_link, contact)
  end
  
  selenium_quit
rescue Exception => e
  selenium_quit
  puts e.message + ' : ' + @test_name
end 