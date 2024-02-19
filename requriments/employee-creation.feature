Feature: Employee Creation in Management Application
 
  As a user of the employee management application
  I want to be able to create an employee profile
  So that the system can verify they are between 18 to 57 years old and are Indian citizens
 
  Background:
    Given the employee management application is up and running
 
  Scenario: Successful creation of an employee who meets the age and citizenship criteria
    When I attempt to create an employee with name "John Doe", age 30, and citizenship "Indian"
    Then the employee should be successfully created
    And the response should include a message "Employee created successfully."
 
  Scenario: Failure to create an employee who is younger than 18
    When I attempt to create an employee with name "Jane Doe", age 17, and citizenship "Indian"
    Then the employee should not be created
    And the response should include a message "Employee creation failed: Age must be between 18 to 57."
 
  Scenario: Failure to create an employee who is older than 57
    When I attempt to create an employee with name "Bob Smith", age 58, and citizenship "Indian"
    Then the employee should not be created
    And the response should include a message "Employee creation failed: Age must be between 18 to 57."
 
  Scenario: Failure to create an employee who is not an Indian citizen
    When I attempt to create an employee with name "Alice Johnson", age 35, and citizenship "American"
    Then the employee should not be created
    And the response should include a message "Employee creation failed: Only Indian citizens are eligible."
 
  Scenario: Failure to create an employee who does not meet age and citizenship criteria
    When I attempt to create an employee with name "Roberto Gomez", age 60, and citizenship "Mexican"
    Then the employee should not be created
    And the response should include a message "Employee creation failed: Age must be between 18 to 57 and must be an Indian citizen."
