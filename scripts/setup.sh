#!/bin/bash
echo "`date`: Copying environment files from: `pwd`"
cp .env.example .env
cp .env.database.example .env.database
echo "Building and bring the Docker containers up"
docker-compose up -d
echo "Creating and seeding the database"
docker-compose exec data-central-hiring rake db:create db:schema:load db:seed
echo "If nothing failed, the My Career Manager site should be available at: http://localhost:3060"
