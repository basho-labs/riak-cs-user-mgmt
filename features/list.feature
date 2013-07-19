Feature: List
  Scenario: No arguments
    When I run `mgmt list`
    Then the exit status should be 0
    And the output should contain "email"
    And the output should contain "display_name"
    And the output should contain "name"
    And the output should contain "key_id"
    And the output should contain "key_secret"
    And the output should contain "id"
    And the output should contain "status"
