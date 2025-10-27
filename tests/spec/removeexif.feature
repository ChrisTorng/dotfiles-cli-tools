Feature: removeexif script
  Removes EXIF metadata from JPEG images using jhead.

  Scenario: Strip EXIF data from images
    Given one or more JPEG files exist
    When I run "removeexif" with the file paths
    Then the script runs jhead -purejpg on each file to remove metadata
