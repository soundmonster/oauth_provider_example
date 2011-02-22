class EntriesController < ApplicationController
  before_filter :login_required

  # GET /entries
  # GET /entries.xml
  def index
    @entries = Entry.all

    respond_to do |format|
      format.html # index.html.erb
      format.any(:xml, :json)  { render request.format.to_sym => @entries }
    end
  end

  # GET /entries/1
  # GET /entries/1.xml
  def show
    @entry = Entry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.any(:xml, :json)  { render request.format.to_sym => @entry }
    end
  end

  # GET /entries/new
  # GET /entries/new.xml
  def new
    @entry = Entry.new

    respond_to do |format|
      format.html # new.html.erb
      format.any(:xml, :json)  { render request.format.to_sym => @entry }
    end
  end

  # GET /entries/1/edit
  def edit
    @entry = Entry.find(params[:id])
  end

  # POST /entries
  # POST /entries.xml
  def create
    @entry = Entry.new(params[:entry])

    respond_to do |format|
      if @entry.save
        format.html { redirect_to(@entry, :notice => 'Entry was successfully created.') }
        format.any(:xml, :json)  { render request.format.to_sym => @entry, :status => :created, :location => @entry }
      else
        format.html { render :action => "new" }
        format.any(:xml, :json)  { render request.format.to_sym => @entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /entries/1
  # PUT /entries/1.xml
  def update
    @entry = Entry.find(params[:id])

    respond_to do |format|
      if @entry.update_attributes(params[:entry])
        format.html { redirect_to(@entry, :notice => 'Entry was successfully updated.') }
        format.any(:xml, :json)  { head :ok }
      else
        format.html { render :action => "edit" }
        format.any(:xml, :json)  { render request.format.to_sym => @entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.xml
  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to(entries_url) }
      format.any(:xml, :json)  { head :ok }
    end
  end
end
