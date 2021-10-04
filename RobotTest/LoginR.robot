*** Setting ***
Library    SeleniumLibrary

*** Variables ***
${WEBAPP}    https://opensource-demo.orangehrmlive.com/    
${CHROME}    chrome


*** Test Cases ***
Login With Valid Credentials
	Given user is on login page
	When user enters valid credentials
	And user clicks login button
	Then user is navigated to dashboard
    
    
*** Keywords ***
User Is On Login Page
    Open Browser    ${WEBAPP}    ${CHROME}
    maximize browser window
    Sleep    2    

User Enters Valid Credentials
    Input Text    id=txtUsername    Admin
    input Password    id=txtPassword    admin123
    Sleep    2    

User Clicks Login Button
    Click Button    id=btnLogin
    
User Is Navigated To Dashboard
    Page Should Contain    Dashboard
    Sleep    2
    Close Browser
    


    