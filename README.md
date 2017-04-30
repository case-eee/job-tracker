# Job Tracker
![Job Tracker Screenshot](/app/assets/images/job_tracker.png)

Job Tracker is a Rails app used to keep tabs on companies and jobs I am interested in. The original project spec can be found [here](https://github.com/turingschool/job-tracker).

## Learning Goals
* Use migrations to create tables with different data types including indexed foreign keys
* Update a routes file using appropriate syntax
* Create controllers with methods for all CRUD functionality appropriately using RESTful routes
* Use ActiveRecord in models to appropriately 1) manage relationships between resources, and 2) perform intermediate queries of a database
* Use best practices in views, partials, and helpers to minimize the number of variables passed and duplication of code and follow SRP

## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Installing

Clone the project

```
$ git clone https://github.com/mollybrown/job-tracker.git
```

Run Bundler to install all dependencies specified in the project Gemfile

```
$ bundle install
```

Setup the test and development databases and add seed data

```
$ rake db:create
$ rake db:migrate
$ rake db:test:prepare
$ rake db:seed
```

Start the Rails server

```
$ rails s
```
Finally, navigate to localhost:3000 in your favorite browser to check out the app.

## Running the tests

To run the test suite, run rspec from the project root directory:

```
$ path/to/project/root rspec
```

## Contributors

* [Molly Brown](https://github.com/mollybrown)
