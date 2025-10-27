Feature: upup script
  Updates Homebrew and Flatpak packages when available.

  Scenario: Update supported package managers
    When I run "upup"
    Then the script runs brew update, upgrade, and cleanup if brew is installed
    And it runs flatpak update --assumeyes if flatpak is installed
