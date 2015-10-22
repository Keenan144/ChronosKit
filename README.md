# Bar-code Generator
A bar-code generator that stores data in an active record database.
### this is a simple project type app
I built this app for practice. It is not intended for use, however can be used. Send me an email with any comments you have at (keenansturtevant@gmail.com), and if you wish to contribute feel free to fork. 
## Getting Started

- 1 Clone [this repo](https://github.com/Keenan144/ChronosKit.git) to your desired location and navigate into it

- 2 run `~ bundle install`


## Set up Database

- 1 run `~ rake db:create`
- 2 run `~ rake db:migrate`
- 3 run `~ rake db:seed`

- 4 run `~ rails c`

```html 

Barcode.new(soss_number: 100001).save
Barcode.new(soss_number: 100002).save
Barcode.new(soss_number: 100003).save
Barcode.new(soss_number: 100004).save

```

## Fire up the server (localhost:3000)

- 1 run `~ rails s`

The app will be running on `localhost:9292`


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
