class WatchersController < ApplicationController
  before_action :set_watcher, only: [:edit, :update, :destroy]

  # GET /watchers
  # GET /watchers.json
  def index
    @watchers = Watcher.all.order(:name)
  end

  # GET /watchers/1
  # GET /watchers/1.json
  def show
    @watcher = Watcher.includes(:tweets).friendly.find(params[:id])
    @statuses = Status.all
    respond_to do |format|
        format.html { render :show, offset: params[:offset]}
        format.json { render json: @watcher.tweets }
    end
  end


  # GET /watchers/new
  def new
    @watcher = Watcher.new
  end

  # GET /watchers/1/edit
  def edit
  end

  # POST /watchers
  # POST /watchers.json
  def create
    @watcher = Watcher.new(watcher_params)

    respond_to do |format|
      if @watcher.save
        client = Twitter::REST::Client.new do |config|
          config.consumer_key        = "1jFn305ISZq4moZsv6mYyGls4"
          config.consumer_secret     = "i8JvIWmswNqA7c9HIpTHJ1nIxZAGGcWyLaGBxfteQXMkNK4DqK"
          config.access_token        = "14191779-n4X4Fs1WDx9IlNqjt5WhDYT0oMttRlmBP3ysoUhII"
          config.access_token_secret = "dixLEBjwapLNrmlZEu2amiB8qcZGihvPnLXoN5d15AgsA"
        end
        # TODO: max_id, since_id
        client.search(@watcher.keywords, :lang => 'en', :count => 100).take(100).collect do |tweet|
          Tweet.create(:watcher_id => @watcher.id, :tweet_id => tweet.id, :fields => tweet.to_h)
        end

        format.html { redirect_to @watcher, notice: 'Watcher was successfully created.' }
        format.json { render :show, status: :created, location: @watcher }
      else
        format.html { render :new }
        format.json { render json: @watcher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /watchers/1
  # PATCH/PUT /watchers/1.json
  def update
    respond_to do |format|
      if @watcher.update(watcher_params)
        format.html { redirect_to @watcher, notice: 'Watcher was successfully updated.' }
        format.json { render :show, status: :ok, location: @watcher }
      else
        format.html { render :edit }
        format.json { render json: @watcher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /watchers/1
  # DELETE /watchers/1.json
  def destroy
    @watcher.destroy
    respond_to do |format|
      format.html { redirect_to watchers_url, notice: 'Watcher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_watcher
      @watcher = Watcher.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def watcher_params
      params.require(:watcher).permit(:name, :keywords)
    end
end
