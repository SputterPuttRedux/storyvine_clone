class WelcomeController < ApplicationController
  def index
    @recent_snippets = Snippet.most_recent
    @popular_snippets = Snippet.most_popular
    @recent_stories = Story.most_recent
    @popular_stories = Story.most_popular
    @random_story =  Story.all.sample
    render :layout => false
  end
end
