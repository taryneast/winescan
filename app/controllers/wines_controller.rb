class WinesController < ApplicationController

  # GET /wines/find
  # GET /wines/find?barcode=12345
  # GET /wines/find.xml
  def find
    @show_actions = false # don't show wine-actions eg edit/delete
    if params[:id]
      @wine = Wine.find_by_id(params[:id])
      flash.now[:error] = "sorry, couldn't find that wine!" unless @wine.present?
    else
      find_params = fetch_finder_params
      if find_params.present?
        # start with just the barcode search!
        if find_params.has_key?(:barcode)
          @barcode = params[:barcode]
          @wines = Wine.all(:conditions => ["barcode LIKE ?", '%'+@barcode+'%'])
        end
      end
    end
    # we've found a unique match!
    @wine = @wines[0] if @wines.present? && @wines.length == 1

    respond_to do |format|
      format.html # find.html.erb
      format.xml  do
        return render(:head => :not_found) if @wine.blank? && @wines.blank?
        return render(:xml => @wine.to_xml(:include => :suppliers), :location => wine_url(@wine)) if @wine.present?
        render :xml => @wines 
      end
    end
  end

  # GET /wines
  # GET /wines.xml
  def index
    @show_actions = true # show wine-actions eg edit/delete
    @wines = Wine.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @wines }
    end
  end

  # GET /wines/1
  # GET /wines/1.xml
  def show
    @show_actions = true # show wine-actions eg edit/delete
    @wine = Wine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @wine }
    end
  end

  # GET /wines/new
  # GET /wines/new.xml
  def new
    @wine = Wine.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @wine }
    end
  end

  # GET /wines/1/edit
  def edit
    @wine = Wine.find(params[:id])
  end

  # POST /wines
  # POST /wines.xml
  def create
    @wine = Wine.new(params[:wine])

    respond_to do |format|
      if @wine.save
        flash[:notice] = 'Wine was successfully created.'
        format.html { redirect_to(@wine) }
        format.xml  { render :xml => @wine, :status => :created, :location => @wine }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @wine.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /wines/1
  # PUT /wines/1.xml
  def update
    @wine = Wine.find(params[:id])

    respond_to do |format|
      if @wine.update_attributes(params[:wine])
        flash[:notice] = 'Wine was successfully updated.'
        format.html { redirect_to(@wine) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @wine.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /wines/1
  # DELETE /wines/1.xml
  def destroy
    @wine = Wine.find(params[:id])
    @wine.destroy

    respond_to do |format|
      format.html { redirect_to(wines_url) }
      format.xml  { head :ok }
    end
  end


  protected ########################################################

  FIND_PARAMS = [:barcode]
  # cleanout only the essential params for our finder
  def fetch_finder_params
    return nil if params.blank? # trivial case
    f_params = {}
    FIND_PARAMS.each {|key| f_params[key] = params[key] if params.has_key?(key) && params[key].present? }

    f_params
  end
end
