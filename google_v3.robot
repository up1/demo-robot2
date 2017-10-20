*** Settings ***
Library  Selenium2Library
Suite Setup    Go to google.com
Suite Teardown   Close Browser

*** Variables ***
${BASE_URL}   https://www.google.co.th

*** Testcases ***
Search data
  [Template]  Flow to find data in google
  #-------------------------------------#
  #   Keyword     |     Expected result |
  #-------------------------------------#
      robot           Robot - Wikipedia
      หวย             ตรวจสลากกินแบ่งรัฐบาล

*** Keywords ***
Flow to find data in google
  [Arguments]   ${word}   ${expected_result}
  Search    ${word}
  Find text    ${expected_result}
  Back to google.com

Search
  [Arguments]  ${word}
  Input Text   name=q   ${word}
  Press Key   name=q   \\13

Find text
  [Arguments]    ${expected_result}
  Page Should Contain   ${expected_result}
  # Wait Until Element Contains   xpath=//*[@id="rso"]/div[1]/div/div[2]/div/div/h3/a  Robot${SPACE}- Wikipedia

Go to google.com
  Open Browser   ${BASE_URL}  browser=gc
  Maximize Browser Window
  Capture Page Screenshot

Back to google.com
  Go To   ${BASE_URL}
