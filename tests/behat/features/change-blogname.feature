Feature: Change blogname and blogdescription (no-js)

  Background:
    Given I am logged in as an admin
    Given I am on the Dashboard
    Given I go to menu item "Settings > General"

  Scenario: blogname
    When I fill in "blogname" with "Awesome WordHat Test Site"
    And I press "submit"
    Then I should see "Settings saved."
  
  Scenario: blogdescription
    When I fill in "blogdescription" with "GitHub + Composer + CircleCi + Pantheon = Win!"
    And I press "submit"
    Then I should see "Settings saved."