Feature: Login as an administrator (no-js)

  Background:
    Given I am logged in as an admin
    Given I am on the Dashboard
    Given I go to menu item "Users > Add New"

  Scenario: Confirm access to create users
    Then I should see "Add New User"