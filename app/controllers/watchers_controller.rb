class WatchersController < ApplicationController
  before_action :set_watcher, only: [:show, :edit, :update, :destroy]

  # GET /watchers
  # GET /watchers.json
  def index
    @watchers = Watcher.all
  end

  # GET /watchers/1
  # GET /watchers/1.json
  def show
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
      @watcher = Watcher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def watcher_params
      params.require(:watcher).permit(:name, :keywords)
    end
end
