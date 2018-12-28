class EntriesController < ApplicationController

  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  #route GET /entries
  #route GET /entries.json
  def index
    @entries = Entry.all
  end

  #route GET /1
  #route GET /1.json
  def show
  end

  #route GET /entries/new
  def new
    @entry = Entry.new
  end

  #route GET /entries/1/edit
  def edit
  end

  #route POST /entries
  def create
    @entry = Entry.new(entry_params)

    respond_to do |format|
      if @entry.save
        redirect_to @entry, notice: "Entry was successfully created"
      else
        render :new
      end
    end

  end

  #route PATH/PUT /entries/1
  def update

    respond_to do |format|
      if @entry.update(entry_params)
        redirect_to @entry, notice: "Entry was successfully updated"
      else
        render :new
      end
    end

  end

  #route DELETE /entries/1
  def destroy
    @entry.destroy
  end

  private
    def set_entry
      @entry = Entry.find(params[:id])
    end

    def entry_params
      params.requre(:entry).permit(:title, :content)
    end

end
