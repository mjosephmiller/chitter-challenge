**USER STORIES**

```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

Features:
------
* A user can sign up to Chitter with their email, password, name and a user name
* Their email must be unique.
* Peeps (posts to chitter) have the name of the user,their username and the time it was posted.
* Bcrypt is used to secure the passwords.
* Data mapper and postgres are used to save the data.
* You don't have to be logged in to see the peeps.
* You can only post if you are logged in.
