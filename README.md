### What Are The Odds?

### Pitch

Similar to truth or dare, this app allows you to challenge your friends to do outlandish things in the name of debauchery. A user can initiate a challenge to another user, asking them to accomplish a task by a certain date. The challengee then has the right to establish a range of numbers (2 - 10) that make the "odds" of acting out said challenge more or less likely. After the odds are established, both users guess a number. If that number matches, the challenge must be completed by the specified date. If not, the challenged user is off the hook.  

![](http://g.recordit.co/XLcias44fK.gif)

### Problem

While visiting friends from home, I realized that we had lost the ability to play this long standing game that used to be such a staple in our lives. Hearing someone say "What are the odds..." over the phone had turned into a nostalgic joke since the game is impossible without the usual exchange of turns.

### Solution

This app will allow friends to play this game from different locations. Users will be able to record and send videos and messages, get mobile push notifications for when they have pending challenges, and post to facebook to share what's going on.
### Target Audience

Targeted users are groups of friends that enjoy a bit of unconventional fun, primarily within the age range of 13-40 (although the age of users who enjoy the game is entirely arbitrary).

### Integrations

Which APIs will you use?
  - For the first version of this application I'll be incorporating Twilio for text message notifications, and Facebook to share posts about what challenges are in the works. Other APIs might be implemented as functionality increases.  

Which OAuth integration are you planning to use?
  - I'll have users log in with Facebook.  

Other Funcationality?
  - I also want to implement web sockets to create user friendly messaging functionality.


### Technical Highlights

  - Use of Headshots Gem for capturing images
  - Amazon Web Services with S3
  - Twilio Gem for text message interaction
  - Javascript functionality for counting down and displaying user guesses

### Technical Challenges
  - One of the most enjoyable parts of this project was the opportunity to reach for functionality that I haven't previously worked with. For this project my main focus was to work with a gem or API that allows a user to take a picture and upload it to the app. My original plan was to capture a video from each user involved in the challenge that would be viewable on the challenge show page. The API I chose to use turned out to be less documented than I required, and I had to go a different direction. Instead I chose to work with Amazon Web Services and a gem called HeadShot that required familiarity with javascript callbacks and custom hooks. This was the first time I was managing a conversation between an external hosting service, a gem, and my own ruby code.

  - This was slo the first project that required extensive logic to determine what was displayed in my views. My initial approach seemed straightforward, but as I dove deeper into additional functionality it became clear that an app with this kind of user interaction required far more logic than I was prepared for. Although the code could use extensive refactoring, it was really cool to expand my awareness on how a user experience should be designed.

  - Another challenge was integrating Javascript into the app. I feel comfortable with basic functions, but integrating more complex interactions with a rails app was a new and exciting challenge. There are obvious ways I can improve on my code for future projects, but it was an incredible learning experience to tackle putting all of the moving pieces together. I am so excited to get more familiar with Javascript and integrate more complicated functionality.
