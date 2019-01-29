require 'rubygems'
require 'net/http'
require 'headless'
require 'selenium-webdriver'

  def get_browser
  	browsers = [ "chrome", "firefox" ]
  end
  
  def get_credit_rating_A_testing
    credit_ratings = [ "excellent", "good", "fair", "poor", "zero" ]
  end
  
  def get_credit_rating_B_testing
    credit_ratings = [  "limited", "bad", "fair", "good", "excellent" ]
  end
  
  def get_card_type
    card_type = [ "zeroIntroAPR", "balanceTransfer", "cashBack", "rewards", "travel", "business" ]
  end

  def open(url)
    @selenium.get url
  end
  
  def get_current_url
    @selenium.current_url
  end

  def selenium_quit #Quits driver adn closes every associated window
    @selenium.quit
  end
  
  def wait_until(how, what, seconds)
    wait = Selenium::WebDriver::Wait.new(:timeout => seconds)
    wait.until { @selenium.find_element(how, what) }
  end

  #element can be by :id, :name, :class_name, :class, :tag_name, :link, :link_text, :partial_link_text, :css, :xpath
  def find_by(element, var) 
    @selenium.find_element(element, var)
  end
  
  def element_present?(how, what)
    @selenium.find_element(how, what)
    true
    rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end
  
  def click(how, what)
    @selenium.find_element(how, what).click
  end

  def http_response(url, var)
    
      uri = URI.parse(url)
      response_code = Net::HTTP.get_response(uri).code
      case response_code
    		when '200'
    		 puts "OK: #{var}"
    		when '301'
    		  puts "Redirect #{var}"
    		when '302'
    		  puts "Redirect: #{var}"
    		when '400'
    		  puts "400: Bad Request - #{var}"
    		when '404'
    		  puts "404: Server Not Found - #{var}"
    		when '500'
    		  puts "500: Internal Server Error - #{var}"
    		when '503'
    		  puts "503: Service Unavailable - #{var}"
    		when '504'
    		  puts "504: Gateway Timeout - #{var}"
    		else
    		  puts "#{response_code} returned. - #{var}"
    		end
    end