require '../master.rb'

begin    
  @test_name = "user-find-perfect-card"
  url = ARGV[0] || "https://www.creditcards.com"
  
  browser = get_browser[rand(get_browser.length)]

  @selenium = Selenium::WebDriver.for browser.to_sym
  
  open(url)
  
  if element_present?(:id, "flow_button")

    credit_rating = get_credit_rating_A_testing[rand(get_credit_rating_A_testing.length)]
    card_type = get_card_type[rand(get_card_type.length)]
    
    #clicking 'Get Recommendations' link
    wait_until(:id, "flow_button", 5)
    click(:id, "flow_button") 
    
    sleep 2
    
    #clicking random user credit rating
    click(:css, "*[for^='#{credit_rating}'] .nexus-fa-layers")
    click(:css, ".nexus-button--primary")

    sleep 2
    
    #clicking random type of card
    click(:css, "*[for^='#{card_type}'] .nexus-fa-layers")
    click(:css, ".nexus-button--contained")

    sleep 2
    
    #clicing to skip search for users current cards
    click(:css, ".nexus-button--contained")

    sleep 2
    
    #clicking to skip search for users current cards
    click(:css, ".nexus-button--contained")
    
    #clicking to skip user details (could add user details for additional test)
    click(:css, ".flow-ccdc-buttons__button--pull-right")
    
    sleep 2
    
    current_url = get_current_url
    if current_url.include?('/results')
      http_response(current_url, "Get Recommendations questionaire returns results")
    else
      puts "FAIL: Get Recommendations questionaire !returns results"
    end
  else
    #clicking random user credit rating and first card type
    credit_rating = get_credit_rating_B_testing[rand(get_credit_rating_B_testing.length)]
    click(:css, "*[for^='#{credit_rating}']")  
    credit_rating == "bad" ? credit_rating = "needsWork" : credit_rating
    credit_rating == "limited" ? credit_rating = "noCredit" : credit_rating
    available_card_link = find_by(:css, ".cardFinder__tabContent--#{credit_rating} .cardFinder__cardFeature:nth-child(4)").attribute('data-page-path')
    http_response(url + available_card_link, url + available_card_link + " http response")
  end
  
  selenium_quit
rescue Exception => e
  selenium_quit
  puts e.message + ' : ' + @test_name
end 

