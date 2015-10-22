# Bar-code Generator
TJ's birthday spy type game
### This is a scavenger hunt 
Go to app/db/seeds.rb to change the riddles and codes. You can also add more tasks there if needed.
## to change background image

- Go to app/public/css/application.css
- comment out `background-color: #fff;`
- add a png image to app/public/imgs
- then change the url("/imgs/YOUR_IMAGE.jpg")

```html

body{
  /*background-color: #fff;*/
  background: url("/imgs/YOUR_IMAGE.jpg") no-repeat center center fixed;
}

```

# How to use (localhost)

- 1 Clone [this repo](https://github.com/Keenan144/spygame.git) to your desired location and navigate into it
- 2 run `~ bundle install`
- 3 run `~ be rake db:create`
- 4 run `~ be rake db:migrate`
- 5 run `~ be rake db:seed`
- 6 run `~ be rackup`

The app will be running on `localhost:9292`

This was a quick app, not really intended to be used. But if you find it useful, let me know. Send me an email with any comments you have at (keenansturtevant@gmail.com), and if you wish to contribute feel free to fork.


# How to use on Heroku

- 1 Be sure you are logged in to heroku through your command line `heroku login`
- 2 Run `~ heroku create`
- 3 Run `~ git push heroku master`
- 4 Run `~ heroku run rake db:migrate`
- 5 Run `~ heroku run rake db:seed`

Heroku auto assigns a url which you can find by looking at the second to last line of the `git push heroku master` ==> To https://git.heroku.com/**SOMETHING-SILLY-9898**.git

Your app will be running on http://**SOMETHING-SILLY-9898**.herokuapp.com/

To rename your app run `heroku rename YOUR-NEW-NAME`

example:

I renamed my heroku app to keenansturtevant.herokuapp.com 

`~ heroku rename keenansturevant`

and my app can be found at [http://keenansturtevant.herokuapp.com/](http://keenansturtevant.herokuapp.com/)
