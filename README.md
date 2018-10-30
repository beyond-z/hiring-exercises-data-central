# Braven Data Warehouse

## Dev Setup
Using docker, it's very easy to get the application up and running. We don't even need to worry about keeping database passwords out of the repo, because Docker will spin up a database that only this application has access to, on a private network.

To setup the development environment run this from the root directory
(aka the directory that this README file is located in):

    ./scripts/setup.sh

This will take a while the first time, because Docker has to download a Ruby image and a PostgreSQL image and set them up. It will also install all the necessary Ruby gems that the app requires.

We've configured Docker to run our Rails app on port 3060, so go to http://localhost:3060 in your favorite browser. If everything's working correctly, you should be brought to a page which says "Welcome!" and has links to the database data. 

### Testing
The test suite can be run from the application root by running

    docker-compose exec data-central-hiring rspec

### Data

### Environment Variables

    DATABASE_HOST
    DATABASE_USERNAME
    DATABASE_PASSWORD
