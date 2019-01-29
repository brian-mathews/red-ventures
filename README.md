# red-ventures

Environment:

Install Homebrew, RVM, Ruby, rubygems

brew install geckodriver
brew install chromedriver
gem install selenium-webdriver
gem install headless
gem install em-net-http

Running tests from Command Line:
Single - 
   ruby <test name>.rb 
Batch -
   sh cc_batch.sh
   
Change Environment:
   ruby <test name>.rb  "https://staging.creditcards.com"
   
   sh cc_batch.sh  "https://staging.creditcards.com"
   
   
The main goal of my test suites is to have short tests that assert critical elements that effect revenue for the company.

Adding the ability to run tests in environments and devices by a simple command line argument expands the use of a single test suite.


	


