require '../master.rb'

begin    
  @test_name = "header-categories-dropdowns-open"
  url = ARGV[0] || "https://www.creditcards.com"
  
  browser = get_browser[rand(get_browser.length)]
  reward_types = { 1 => "cash-back", 2 => "points", 3 => "miles" }

  @selenium = Selenium::WebDriver.for browser.to_sym
  
  open(url)
  
  reward_types.each do |key, value|
    click(:css, "#homepage-tab-panel-earn .homePage__tabs__subToggles .homePage__tabs__subToggle:nth-child(#{key})")
    
    sleep 1
    
    if find_by(:css, "#homepage-tab-panel-earn #homepage-tab-subpanel-#{value}").displayed?
      puts "PASS: Earned #{value} Dropdown Visible"
    else
      puts "FAIL: Earnd #{value} Dropdown Not Visible"
    end
  end
  
  selenium_quit
rescue Exception => e
  selenium_quit
  puts e.message + ' : ' + @test_name
end 