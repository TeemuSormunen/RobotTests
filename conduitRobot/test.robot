*** Settings ***

Library    SeleniumLibrary

*** Variables ***
${ADRESS}    https://demo.realworld.io
${BROWSER}    firefox
${USERNAME}  robotest@test.com
${PASSWORD}    TestRobo56
${TITLE}    Article created by Robot Framework
${SUBJECT}    Test Automation
${ARTICLE}    This article is posted by Robot Framework
${TAG}    "#ROBOTFRAMEWORK"

*** Keywords ***
Login
    Open Browser    ${ADRESS}    ${BROWSER}
    Click Link  link: Sign in
    Location Should Be    https://demo.realworld.io/#/login
    Input Text     	xpath://input[@type="email"]    ${USERNAME}
    Input Password    xpath://input[@type="password"]    ${PASSWORD}
    Click Button    xpath://button[@type="submit"]
    Sleep     2
    
Write Article
    Click Link    partial link: Article
    Input Text     	xpath://input[@placeholder="Article Title"]    ${TITLE}
    Input Text     	xpath://input[@placeholder="What's this article about?"]    ${SUBJECT}
    Input Text     	xpath://textarea[@placeholder="Write your article (in markdown)"]    ${ARTICLE}
    Input Text     	xpath://input[@placeholder="Enter tags"]    ${TAG}
    Click Button    xpath://button[@type="button"]
    Sleep    3
    Title Should Be    Article created by Robot Framework — Conduit
*** Test Cases ***
Create post
    Login
    Write Article