# API Setup

- As a developer, I can create a new Rails application with a Postgresql database.
    $ rails new cat-tinder-backend -d postgresql -T
    $ cd cat-tinder-backend
    $ rails db:create

- As a developer, I can create a RSpec testing suite in my Rails application.
    $ bundle add rspec-rails
    $ rails generate rspec:install
    $ rails server

- As a developer, I can add a resource for Cat that has a name, an age, what the cat enjoys doing, and an image.
    $ rails generate resource Cat name:string age:integer hobbies:text image:text
    $ rails db:migrate

- Add the remote from your GitHub classroom repository
- Create a default branch (main)
- Make an initial commit to the repository

____________________________________________________________________________________

# API Seeds

- As a developer, I can add cat seeds to the seeds.rb file.
    $ rails db:seed

- As a developer, I can run the rails command to add cats to database.
    $ rails c 
    $ Cat.all

____________________________________________________________________________________

# API CORS (Cross-Origin Resource Sharing)

- As a developer, I can enable my controller to accept requests from outside applications.
    - Add to the app_controller
    ```ruby
    class ApplicationController < ActionController::Base
        skip_before_action :verify_authenticity_token
    end
    ```

- As a developer, I can add the CORS gem to my Rails application in the Gemfile.
    $ gem 'rack-cors', :require => 'rack/cors'

- As a developer, I can add the cors.rb file to my application.
    - Add to config/initializers/cors.rb
    ```ruby
    Rails.application.config.middleware.insert_before 0, Rack::Cors do
        allow do
            origins '*'  # <- change this to allow requests from any domain while in development.

            resource '*',
                headers: :any,
                methods: [:get, :post, :put, :patch, :delete, :options, :head]
        end
    end
    ```

    $ bundle

____________________________________________________________________________________


# API Endpoints 

- As a developer, I can add an index endpoint to my application.
- As a developer, I can add an index request spec to my application.

- As a developer, I can add a create request spec to my application.
- As a developer, I can add a create endpoint to my application.

- As a developer, I can add an update request spec to my application.
- As a developer, I can add an update endpoint to my application.

- As a developer, I can add a destroy request spec to my application.
- As a developer, I can add a destroy endpoint to my application.

    ## Destroy Test Notes

    - Difference between find() and find_by() :
        - find could only be used to search by primary key (usually the ‘id’) 
        - find_by() requires and searches by attribute (either passed as hash like Employee.find_by(name: ‘Mike’) or using the Employee.find_by_name(‘Mike’) method)
        - source: https://www.nopio.com/blog/ruby-rails-popular-job-interview-questions/#:~:text=The%20additional%20difference%20between%20find
