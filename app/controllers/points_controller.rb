class PointsController < ApplicationController
  before_filter :get_layer
  
  # The before_filter action to get the current layer for
  # for all the points.
  def get_layer
    @layer = Layer.find(params[:layer_id])
  end

  # GET /points
  # GET /points.xml
  def index
    @points = @layer.points.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @points }
      format.kml # index.kml.builder
    end
  end

  # GET /points/1
  # GET /points/1.xml
  def show
    @point = Point.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @point }
      format.kml  # show.kml.builder
    end
  end

  # GET /points/new
  # GET /points/new.xml
  def new
    @point = Point.new({:layer => @layer})

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @point }
    end
  end

  # GET /points/1/edit
  def edit
    @point = Point.find(params[:id])
  end

  # POST /points
  # POST /points.xml
  def create
    @point = Point.new(params[:point])

    respond_to do |format|
      if @point.save
        format.html { redirect_to([@layer, @point], :notice => 'Point was successfully created.') }
        format.xml  { render :xml => @point, :status => :created, :location => @point }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @point.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /points/1
  # PUT /points/1.xml
  def update
    @point = Point.find(params[:id])

    respond_to do |format|
      if @point.update_attributes(params[:point])
        format.html { redirect_to([@layer, @point], :notice => 'Point was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @point.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /points/1
  # DELETE /points/1.xml
  def destroy
    @point = Point.find(params[:id])
    @point.destroy

    respond_to do |format|
      format.html { redirect_to(layer_points_url) }
      format.xml  { head :ok }
    end
  end
end
