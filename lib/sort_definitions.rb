module SortDefinitions
  VALID_SORTS = ["location", "interest"]
  SORT_EXPRESSIONS = {
    "location" => "city ASC",
    "interest" => "level_of_interest DESC"
  }
end