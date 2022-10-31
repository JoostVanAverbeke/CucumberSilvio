Feature: Does the Silvio Integration Test Framework support the sending of URL messages to an ABL application
  Translator Service?

  Scenario: Sending of a valid URL message to a Translator Service
    Given an active translator service
    When I send a valid URL message to the translator service
    Then the translator service responds with an URL accept message
