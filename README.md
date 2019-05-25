# Breaking Down Barriers

This app aims to connect formerly incarcerated individuals with employers and mentors willing to hire and assist them with stability and support during their transition back into society. Potential Employees/Mentors can login with Google OAuth while Employers login through the application. Employers can post jobs. Users can create a profile, save jobs, and add mentors. Users can opt into being a mentor and will appear available to other users if active. Location of users and jobs are geocoded and mapped for easy reference to local jobs. Includes an endpoint that returns all of the jobs listed in JSON format. 


## Deployment
Application is deployed at https://sheltered-woodland-96290.herokuapp.com/  
Jobs API Endpoint: https://sheltered-woodland-96290.herokuapp.com/api/v1/jobs

## Getting Started

These instructions will get this project running on your local machine for development and testing purposes.

1. Clone this repository and cd into the breaking_down_barriers directory

  ```
  git clone https://github.com/kelleyjenkins/breaking_down_barriers.git
  cd breaking_down_barriers
  ```

2. Install gems
  ```
  bundle install
  ```

3 Start the server
  ```
  rails s
  ```

4 Once the server is running, you can visit this app locally in your browser:
* `http://localhost:3000`

## Built With
 * Ruby
 * Rails
 * JavaScript
 * Geocoder Gem
 * GoogleMaps API
 
 ## Developers
 - [Kelley Jenkins](https://github.com/kelleyjenkins)
 
 ## Additional Information
 
 This was a self-directed 2 week project completed for Module 3 at Turing School of Software & Design. 
