Feature: Create
  Scenario: No arguments
    When I run `mgmt create`
    And the stderr should contain:
    """
    ERROR: mgmt create was called with no arguments
    Usage: "mgmt create [NAME] [EMAIL]".
    """

  Scenario: Only a name argument
    When I run `mgmt create name`
    And the stderr should contain:
    """
    ERROR: mgmt create was called with arguments ["name"]
    Usage: "mgmt create [NAME] [EMAIL]".
    """

  Scenario: A name and an e-mail address
    When I run `mgmt create name admin@admin.com`
    Then the exit status should be 0

  Scenario: A name and an e-mail address that already exists
    When I run `mgmt create name admin@admin.com`
    Then the exit status should be 1
    And the stderr should contain:
    """
    User already exists.
    """
