# README

Start Up (From the console on a UNIX machine)

* This readme assumes you have some prior setup on your machine, if this is not the case, this tutorial should help you with installing git, bundler, homebrew and ruby:

** http://backend.turing.io/prework/environment_setup_prework

* To use this api, clone it down using the console:
```
git clone https://github.com/samuelssnider/rails-engine.git
```
* To install the gems:
```
bundle install
```
* To update the gems:
```
bundle update
```

* Ruby version - 2.4.1p111

* To create the database, run:
```
rake db:create 
```
* To create the database, run:
```
rake db:migrate
```
* To populate the database, run:
```
rake populate
```
* How to run the test suite
```
$ rspec
```
* How to clone the spec harness (should be on the same directory 'level' as the rails engine repositiory):
```
git clone https://github.com/turingschool/rales_engine_spec_harness
```
* How to run the spec harness:
```
rake
```
