#!/usr/bin/env bats

@test "mongo installed" {
  run which mongo 
  [ "$status" -eq 0 ]
}

@test "mongodb running" {
  run mongo --eval "db.stats()"
  [ "$status" -eq 0 ]
}

@test "mongodb contains three elements" {
  run mongo ndb --quiet --eval "db.nutrition.stats().count"
  [ "$output" = "3" ]
}
