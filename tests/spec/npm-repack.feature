Feature: npm-repack script
  Repackages npm tarballs with optimal gzip compression for comparison.

  Scenario: Repack an npm package
    Given an npm package name or directory
    When I run "npm-repack" with the target
    Then npm pack generates a tarball
    And the script reports the original size, recompresses with zopfli, and reports the new size
