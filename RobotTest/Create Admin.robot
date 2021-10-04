*** Setting ***
Library    SeleniumLibrary
Library    FakerLibrary


*** Variables ***
${WEBAPP}    https://opensource-demo.orangehrmlive.com/    
${CHROME}    chrome


*** Test Cases ***
Create Admin User
    Given user login valid credentials
    When user click admin navigation button
    And user click add button
    And user fill-up the form
    And user click save button
    Then user successfully created
   
    
Search User
    Given user in admin page
    When user enter valid username
    And user selects role as ESS
    And user enter valid employee name
    And user click search button
    Then user viewed employee 
     


*** Keywords ***
User Login Valid Credentials
    Open Browser    ${WEBAPP}    ${CHROME}
    maximize browser window
    Input Text    id=txtUsername    Admin
    input Password    id=txtPassword    admin123
    Click Button    id=btnLogin
    Sleep    2   

User Click Admin Navigation Button
    click element       //a[@href="/index.php/admin/viewAdminModule"]
    Sleep    2 
    
User Click Add Button    
    Click Button    id=btnAdd   
    Sleep    2  

User Fill-Up The Form
    ${RANDOMROLE}=      Random Element    ['1', '2']
    Select from list by value    systemUser_userType    ${RANDOMROLE}
    
    Input Text    id=systemUser_employeeName_empName    David Morris
    
    ${USERNAME}=    Name
    Input Text    id=systemUser_userName     ${USERNAME}
    
    ${RANDOMSTATUS}=      Random Element    ['0', '1']
    Select from list by value    systemUser_status    ${RANDOMSTATUS}    
    
    ${PASSWORD}=    Password    length=15
    Input Password    id=systemUser_password    ${PASSWORD}
   
    Input Password    id=systemUser_confirmPassword    ${PASSWORD}
    
    Sleep    3
User Click Save Button    
    Click Button    name=btnSave
    Sleep    2

User Successfully Created
    Sleep    6


#SEARCH USER
User In Admin Page  
    Page Should Contain    Admin 

user enter valid username
    Input Text    id=searchSystemUser_userName    Charlie.Carter
        
User Selects Role As Ess
    Select From List By Index    id=searchSystemUser_userType    2
    
User Enter Valid Employee Name
    Input Text    id=searchSystemUser_employeeName_empName    Charlie Carter
    Sleep    2    

User Click Search Button
    Click Button    name=_search
    Sleep    2
    
User Viewed Employee  
    Sleep    6
    Close Browser
    