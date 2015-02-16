# MVP Review

## Startup

1. Document how to get things up and running in your Readme.me
2. I don't think you should ship the ./solr directory what you should do is add
that directory to the .gitignore file and then use `git rm -rf solr` to remove
it entirely.


## Testing

1.  Factories: name them singularly like the model.  Be sure to use the
built-ins that FactoryGirl provides you.  Things like `association` etc. will make
you life much easier.

### Controller Tests

Need moar.  They are generally having their function duplicated in the feature
tests.

* They have the ability to take slowness out of your tests that are feature
  tests
* Feel free to take cues from the generators from time to time

Recommendation: Migrate feature tests to controller tests

##  Layout

`thumbsup.png` should be in app/assets/images

## Assets

We simplified our application.js considerably.

On heroku:  install a thing called heroku_12factor gem.  It will make your
application serve assets.
