require '../master.rb'

begin    
  @test_name = "header-categories-dropdowns-open"
  url = ARGV[0] || "https://www.creditcards.com"
  
  browser = get_browser[rand(get_browser.length)]

  @selenium = Selenium::WebDriver.for browser.to_sym
  
  open(url)
  
  4.times do |index|
    click(:css, ".menu .menu__item:nth-child(#{index + 1})")
    
    sleep 1
    
    if find_by(:css, ".menu .menu__item:nth-child(#{index + 1}) .menu__submenu").displayed?
      puts "PASS: Dropdown Visible #{index + 1}"
    else
      puts "FAIL: Dropdown Not Visible"
    end
  end
  
  selenium_quit
rescue Exception => e
  selenium_quit
  puts e.message + ' : ' + @test_name
end 

