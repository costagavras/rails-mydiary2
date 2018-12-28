class EntriesController < ApplicationController
  def index
    @entries = Entry.all
  end

  def show
  end

  def new
    @entry = Entry.new
  end

  def edit
  end

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

  def update

    respond_to do |format|
      if @entry.update(entry_params)
        redirect_to @entry, notice: "Entry was successfully updated"
      else
        render :new
      end
    end

  end

  def destroy
    @entry.destroy, notice: "Entry was successfully deleted"
  end

end
