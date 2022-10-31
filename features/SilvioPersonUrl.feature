Feature: Does Silvio support the sending of person URL messages with different identifications?

  Scenario: Sending a person URL message with an identification to a Translator Service
    Given an active translator service
    When I send a person URL message with an identification "123454423" assigned by "H_SZR", to the translator service
    Then the translator service responds with an URL accept message

  Scenario: Sending a person URL message with a multiple identifications to a Translator Service
    Given an active translator service
    When I send a person URL message with the following identifications to the translator service
    |code                     | assigned_by|
    |4268462834               | H_SZR      |
    |461239461293             | UZG        |
    |583-6834-353             | INS-C      |
    Then the translator service responds with an URL accept message
