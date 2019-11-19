## Recurring Disco Blog

### Overview
Recurring Disco Blog is an experimental project using the `Recurly.js` library to implement a Recurly payment gateway.  The blog allows subscribing (recurring) users to read and comment on blog posts about disco, while non-recurring users are directed to log in or register. Concepts implemented include sessions, authorization, authentication, query caching, relational databases, testing, and RESTful design.  The project was done in just over a day, so certain factors were unable to be addressed due to time (such as more intricate styling).  

* To see blog posts and comment, log in as a recurring user with the following credentials: 
`email: test_1@gmail.com, password: password`

* To see paywalls and Recurly redirects, register and login as a new user.

### Production Links
###### [Full Stack Application](https://powerful-badlands-17766.herokuapp.com)

### Setup

**Git Setup**
```
$ git clone https://github.com/Mycobee/recurring-disco
$ cd recurring-disco
$ bundle install
```
**Database & Models**  
```
$ bundle exec rails db:create  
$ bundle exec rails db:migrate  
$ bundle exec rails db:seed
```
**Testing**
```
$ bundle exec rspec
```

### Versions

`Rails 6.0.1`  
`Bundler 2.0.2`  

### Testing
RSpec was used to test all models and features.  Edge cases were also covered, as well as many form validations and authorization based on session.

### Schema
To view schema, run `open active_designer/index.html` from the root path of the project

### Tech Stack
* Ruby On Rails
* RSpec
* PostgreSQL
* ActiveRecord
* JavaScript
* Recurly.js
* Bcrypt
* HTML5/CSS3
* Heroku PaaS

### Project Boards
###### [Recurring Disco Board](https://github.com/Mycobee/recurring-disco/projects/1)

### Features

#### Navigation
```
As a visitor: 

I see a navigation bar
This navigation bar includes links for the following:

- a link to return to the welcome / home page of the application ("/")
- a link to browse all articles ("/articles")
- a link to log in ("/login")
- a link to the user registration page ("/register")

As a non-recurring user:

I see a navigation bar
This navigation bar includes links for the following:

- a link to return to the welcome / home page of the application ("/")
- a link to browse all articles ("/articles")
- a link to log out ("/logout")
- a link to join with recurly ("/join")

As a recurring user:

I see a navigation bar
This navigation bar includes links for the following:

- a link to return to the welcome / home page of the application ("/")
- a link to browse all articles ("/articles")
- a link to log out ("/logout")
```

#### User Registration
```
As a visitor
When I click on the 'register' link in the nav bar
Then I am on the user registration page
And I see a form where I input the following data:
- name
- street address
- my city
- state
- code
- email
- password
- a confirmation field for my password

When I fill in this form completely, and with a unique email address not already in the system, my details are saved in the database.

I am logged in as a registered user

I am taken to the articles path

I see a flash message indicating that I am now registered and logged in
```

#### User Login
```
As a visitor
When I visit the login path
I see a field to enter my email address and password
When I submit valid information
I am redirected to my profile page
If I am an admin user, I am redirected to the root path
And I see a flash message that I am logged in
```

#### User Logout
```
As a registered user or admin
When I visit the logout path
I am redirected to the welcome / home page of the site
And I see a flash message that indicates I am logged out
```

#### Articles Index Page
```
As a visitor or registered user
When I click on the 'articles' link in the nav bar
I am on the articles index page
I see each article in the database with the following information

- Title as a show page link
- Preview of body
```

#### Articles Show Page
```
As a logged in recurring user on the articles index page,
When I click on an article show page link,
I am on that article's show page,
I see the title and full body of the article

If I am not logged in, I am redirected to the login page
If I am not recurring, I am redirected to the recurly page
```

### Recurring user can add comments
```
As a logged in  recurring user on an article show index page,
I see all comments for that articles,
I can fill in a form and post a comment
```

### Activate Recurring User
```
As a logged in but non recurring visitor, I see a link to `Join` in my navbar, which directs me to `/recurly/new`
This page lands me at a Recurly form where I can enter the following card information to subscribe:

- first name
- last name
- card number
- expiration
- CVV
```
