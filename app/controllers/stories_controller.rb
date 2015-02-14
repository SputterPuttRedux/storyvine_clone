class StoriesController < ApplicationController
  before_action :set_stories, only: [:show, :edit, :destroy, :update]

  def index
    # displays all published stories
    @stories = Story.all.where(published: true)
  end

  def show
    # show particular story
  end

  def new
    # show a new story form
    @story = Story.create
  end

  def create
    # create new story
    @story = Story.new story_params
    if @story.save
      redirect_to story_path(@story)
    else
      render :new
    end
  end

  def edit
    # edit a particular story
  end

  def update
    @story = Story.find(params["id"])
    if @story.update(content: params["story"]["content"])
      if request.xhr?
        render plain: "Autosaved on " + @story.updated_at.strftime("%m/%d/%Y at %I:%M:%S %p")
      else
        redirect_to story_path(@story)
      end
    else
      redirect_to :back
    end
  end

  def destroy
    story.destroy
    redirect_to root_path
  end


  private

  def set_stories
    @story = Story.find(params[:id])
  end

  def story_params
    params.require(:story).permit(:title, :content)
  end


end
