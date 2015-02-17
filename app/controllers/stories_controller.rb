class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :destroy, :update, :new_nested_story, :create_nested_story]
  # before_action :child_story_params, only: [:new_nested_story, :create_nested_story]

  def index
    # displays all published stories
    @stories = Story.all.where(published: true)
  end

  def search
    #displays all stories searched for
    @search = Story.search do
      fulltext params[:search]
    end
    @searched_stories = @search.results
  end

  def show
    find_vote(@story)
    @story.remove_dangerous_html_tags!
    @snippet = @story.snippet
    @tags = Tag.tags_for_select
    # show particular story
  end

  def new
    @story = Story.create(snippet_id: params[:snippet_id])
  end


  def create
    # create new story
    @story = Story.new(story_params)
    if @story.save
      redirect_to story_path(@story)
    else
      render :new
    end
  end


  def edit
    @story.remove_dangerous_html_tags!
  end

  def update
    @story = Story.find(params["id"])
    if @story.update(content: params["story"]["content"], title: params["story"]["title"], published: params["story"]["published"])
      User.find(session[:user_id]).stories << @story
      if request.xhr?
        render plain: "Autosaved on " + @story.updated_at.strftime("%m/%d/%Y at %I:%M:%S %p")
      else
        redirect_to story_path(@story)
      end
    else
      if request.xhr?
        render plain: "Failed to autosave: #{@story.errors.messages.inspect}"
      else
        flash[:notice] = "There was an error saving your story. Please make sure the fields aren't blank."
        render :new
      end
    end
  end

  def destroy
    @story.destroy
    redirect_to root_path
  end


  def flag
    @story = Story.find(params[:id])
    if !(Flag.where(flaggable_type: "Story", flaggable_id: @story.id))
      @story.flag(session[:user_id])
    end
    flash[:notice] = "Thank you. We'll look into this shortly."
    redirect_to story_path(@story.id)
  end

  def new_nested_story
    @story_new = Story.new
    # render :create_nested_story
  end

  def create_nested_story
     @story_new = Story.new(title: params[:title], author_id: params[:session_id], parent_id: set_story.id, snippet_id: params[:story][:snippet_id])
    if @story_new.save
      @parent = set_story
      @parent.children << @story_new
      redirect_to story_path(@story_new)
    else
      render :new
      # this should give errors
    end
  end


  private

  def find_vote(story)
    @vote = story.votes.find_by(user_id: session[:user_id], story_id: story.id )
  end

  def set_story
    @story = Story.find(params[:id])
  end

  def story_params
    params.require(:story).permit(:title, :content, :snippet_id, :author_id, :published, :parent_id)
  end

  # def child_story_params
  #   @new_story = Story.find(params[:new_story].id)
  # end


end
