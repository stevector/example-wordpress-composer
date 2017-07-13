Feature: Confirm blogname and blogdescription

  Background:
    Given I am on the homepage

  Scenario: Title
	  Then I should see "Awesome WordHat Test Site" in the "h1 a" element

  Scenario: Description
	  Then I should see "GitHub + Composer + CircleCi + Pantheon = Win!" in the ".site-description" element
