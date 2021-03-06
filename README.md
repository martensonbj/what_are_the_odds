# What Are The Odds?
_____

### Authors
This application was built by [Brenna Martenson](https://github.com/martensonbj) for the [Turing School of Software & Design](https://www.turing.io).

### Project Specifications
This was a two week project completed during the third module of a seven month back end development program. This was a personal project designed to tie together knowledge acquired throughout the first three mods of our program.

### Pitch

Similar to truth or dare, this app allows you to challenge your friends to do outlandish things in the name of debauchery. A user can initiate a challenge to another user, asking them to accomplish a task by a certain date, finalized by a simple guessing game of odds. 

![](http://g.recordit.co/XLcias44fK.gif)

### Problem

While visiting friends from home, I realized that we had lost the ability to play this long standing game that used to be such a staple in our lives, always starting with "What are the odds...".

### Solution

This app will allow friends to play this game from different locations. Users will be able to record and send videos and messages, get mobile push notifications for when they have pending challenges, and post to facebook to share what's going on.

### Target Audience

Targeted users are groups of friends that enjoy a bit of unconventional fun.

### Integrations

Which APIs will you use?
  - For the first version of this application I'll be incorporating Twilio for text message notifications, and Facebook to share posts about what challenges are in the works. Other APIs might be implemented as functionality increases.  

Which OAuth integration are you planning to use?
  - I'll have users log in with Facebook.  

Other Funcationality?
  - If time permits I want to implement web sockets to create user friendly messaging functionality.


### Technical Highlights

  - Use of Headshots Gem for capturing images
  - Amazon Web Services with S3
  - Twilio Gem for text message interaction
  - Javascript functionality for counting down and displaying user guesses

### Technical Challenges
  - One of the most enjoyable parts of this project was the opportunity to reach for functionality that I haven't previously worked with. For this project my main focus was to work with a gem or API that allows a user to take a picture and upload it to the app. My original plan was to capture a video from each user involved in the challenge that would be viewable on the challenge show page. The API I chose to use turned out to be less documented than I required, and I had to go a different direction. Instead I chose to work with Amazon Web Services and a gem called HeadShot that required familiarity with javascript callbacks and custom hooks. This was the first time I was managing a conversation between an external hosting service, a gem, and my own ruby code.

  - This was the first project that required extensive logic to determine what was displayed in my views. My initial approach seemed straightforward, but as I dove deeper into additional functionality it became clear that an app with this kind of user interaction required far more logic than I was prepared for. Although the code could use extensive refactoring, it was really cool to expand my awareness on how a user experience should be designed.

  - Another challenge was integrating Javascript into the app. I feel comfortable with basic functions, but integrating more complex interactions with a rails app was a new and exciting challenge. There are obvious ways I can improve on my code for future projects, but it was an incredible learning experience to tackle putting all of the moving pieces together. I am so excited to get more familiar with Javascript and integrate more complicated functionality.
