*** Setting ***
Library    SeleniumLibrary
Library    FakerLibrary

*** Variables ***
${WEBAPP}    https://opensource-demo.orangehrmlive.com/    
${CHROME}    chrome


*** Test Cases ***
Update Personal Details
    Given user login valid credentials
    When user click My Info to view personal details
    And user click edit button 
    And user update necessary information
    And user click save button
    Then user successfully updated personal details

Update Contact details
    Given user in personal detail page
    When user click contact details 
    And user click contact edit button
    And user update contact information
    And user click contact save button
    Then user successfully updated contact details


Update Emergency Contacts
    Given user in contact detail page
    When user click emergency contacts
    And user click add button
    And user add emergency contact information
    And user click save emergency contact button
    Then user successfully added emergency contact
             

*** Keywords ***
User Login Valid Credentials
    Open Browser    ${WEBAPP}    ${CHROME}
    maximize browser window
    Input Text    id=txtUsername    Admin
    input Password    id=txtPassword    admin123
    Click Button    id=btnLogin
    Sleep    2   

User Click My Info To View Personal Details
    click element    //a[@href="/index.php/pim/viewMyDetails"]
    Sleep    2 
    
User Click Edit Button
    Click Button    id=btnSave
    Sleep    2

User Update Necessary Information
    ${FIRSTNAME}=    First Name Male
    ${MIDDLENAME}=    Last Name Male
    ${LASTNAME}=    Last Name Male
    ${NICKNAME}=    First Name Male
    Input Text    id=personal_txtEmpFirstName    ${FIRSTNAME}
    Input Text    id=personal_txtEmpMiddleName    ${MIDDLENAME}
    Input Text    id=personal_txtEmpLastName    ${LASTNAME}
    Input Text    id=personal_txtEmpNickName    ${NICKNAME}
    Sleep    2   

User Click Save Button
    Click Button    id=btnSave
    Sleep    2
    
User Successfully Updated Personal Details
    Sleep    3
    

#Update Contact Details
User In Personal Detail Page
    Page Should Contain    Personal Details 
     
User Click Contact Details    
    click element       //a[@href="/index.php/pim/contactDetails/empNumber/7"]
    Sleep    2 

User Click Contact Edit Button
    Click Button    id=btnSave
    Sleep    2
    
User Update Contact Information 
    ${ADDRESS1}=    Address
    Input Text    id=contact_street1    ${ADDRESS1}     
                    
    ${ADDRESS2}=    Secondary Address    
    Input Text    id=contact_street2    ${ADDRESS2}
    
    ${City}=    City
    Input Text    id=contact_city    ${City}     
    
    ${State}=    State
    Input Text    id=contact_province    ${State}     
    
    ${POSTAL}=    Postalcode
    Input Text    id=contact_emp_zipcode    ${POSTAL}
    
    ${RANDOMCOUNTRY}=      Random Element    ['AF', 'AL', 'DZ', 'AS', 'AD', 'AO', 'AI', 'AQ', 'AG', 'AR', 'AM', 'AW']
    Select from list by value    contact_country    ${RANDOMCOUNTRY}
        
    Input Text    id=contact_emp_hm_telephone     1111-2222-3333
    
    Input Text    id=contact_emp_mobile     0912-345-6789
    
    ${EMAIL}=    Email
    Input Text    id=contact_emp_work_email     ${EMAIL}
    
    ${EMAIL2}=    Email
    Input Text    id=contact_emp_oth_email     ${EMAIL2}
    Sleep    3
    
    
User Click Contact Save Button
    Click Button    id=btnSave
    Sleep    2
    
    
User Successfully Updated Contact Details  
    Sleep    3
    

#Update Emergency Contact
User In Contact Detail Page    
    Page Should Contain    Contact Details
        
User Click Emergency Contacts
    click element       //a[@href="/index.php/pim/viewEmergencyContacts/empNumber/7"]
    Sleep    2 
    
User Click Add Button  
    Click Button    id=btnAddContact
    Sleep    2
         
User Add Emergency Contact Information  
    ${ENAME}=    Name Female   
    Input Text    id=emgcontacts_name    ${ENAME}     
    Input Text    id=emgcontacts_relationship    Spouse 
    Input Text    id=emgcontacts_homePhone    8080-0808
    Input Text    id=emgcontacts_mobilePhone    0912-345-6789
    Input Text    id=emgcontacts_workPhone    8012-3456
    Sleep    2  
        
User Click Save Emergency Contact Button  
    Click Button    id=btnSaveEContact
    Sleep    2
    
User Successfully Added Emergency Contact
    Sleep    3
    Close Browser              
      