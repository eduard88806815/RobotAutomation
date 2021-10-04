*** Setting ***
Library    SeleniumLibrary


*** Variables ***
${WEBAPP}    https://opensource-demo.orangehrmlive.com/    
${CHROME}    chrome



*** Test Cases ***
Delete Employee
    Given user login valid credentials
    When user click PIM navigation button to show employee list
    And user select employee to delete
    And user click delete button
    And user click ok to confirm deletion
    Then employee successfully deleted
    
Delete Candidates
    Given user in employee list
    When user click recruitment navigation button
    And user select candidate to delete
    And user click candidate delete button
    And user click ok to confirm candidate deletion
    Then candidate successfully deleted
    


*** Keywords ***
User Login Valid Credentials
    Open Browser    ${WEBAPP}    ${CHROME}
    maximize browser window
    Input Text    id=txtUsername    Admin
    input Password    id=txtPassword    admin123
    Click Button    id=btnLogin
    Sleep    2    

User Click Pim Navigation Button To Show Employee List
    click element    //a[@href="/index.php/pim/viewPimModule"]
    Sleep    2 

User Select Employee To Delete
    Select Checkbox    ohrmList_chkSelectRecord_2
    Sleep    2 
     
User Click Delete Button
    Click Button    id=btnDelete
    Sleep    2 
    
User Click Ok To Confirm Deletion
    Click Button    id=dialogDeleteBtn
    Sleep    2 
    
Employee Successfully Deleted
    Sleep    4
    

#Delete Candidate
User In Employee List
    Page Should Contain    Employee Information
    
User Click Recruitment Navigation Button
    click element       //a[@href="/index.php/recruitment/viewRecruitmentModule"]
    Sleep    2
    
User Select Candidate To Delete
    Select Checkbox    ohrmList_chkSelectRecord_23_9
    Sleep    2 
    
User Click Candidate Delete Button
    Click Button    id=btnDelete
    Sleep    2        

User Click Ok To Confirm Candidate Deletion
    Click Button    id=dialogDeleteBtn
    Sleep    2 
    
Candidate Successfully Deleted  
    Sleep    5
    Close Browser     