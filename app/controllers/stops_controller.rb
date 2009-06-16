class StopsController < ApplicationController
  before_filter :load_schedule
  
  # GET /stops
  # GET /stops.xml
  def index
    @stops = @schedule.stops.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stops }
    end
  end

  # GET /stops/1
  # GET /stops/1.xml
  def show
    @stop = @schedule.stops.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stop }
    end
  end

  # GET /stops/new
  # GET /stops/new.xml
  def new
    @stop = @schedule.build_stop

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stop }
    end
  end

  # GET /stops/1/edit
  def edit
    @stop = @schedule.stops.find(params[:id])
  end

  # POST /stops
  # POST /stops.xml
  def create
    @stop = @schedule.stops.build(params[:stop])

    respond_to do |format|
      if @stop.save
        flash[:notice] = 'Stop was successfully created.'
        format.html { redirect_to(schedule_path(@schedule)) }
        format.xml  { render :xml => @stop, :status => :created, :location => @stop }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stop.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stops/1
  # PUT /stops/1.xml
  def update
    @stop = @schedule.stops.find(params[:id])

    respond_to do |format|
      if @stop.update_attributes(params[:stop])
        flash[:notice] = 'Stop was successfully updated.'
        format.html { redirect_to(@stop) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stop.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stops/1
  # DELETE /stops/1.xml
  def destroy
    @stop = @schedule.stops.find(params[:id])
    @stop.destroy

    respond_to do |format|
      format.html { redirect_to(schedule_url(@schedule)) }
      format.xml  { head :ok }
    end
  end
  
private
  def load_schedule
    @schedule = Schedule.find(params[:schedule_id])
  end
end
