class RequestsClosuresController < ApplicationController
  before_action :set_requests_closure, only: [:show, :edit, :update, :destroy]

  # GET /requests_closures
  # GET /requests_closures.json
  def index
    @requests_closures = RequestsClosure.all
  end

  # GET /requests_closures/1
  # GET /requests_closures/1.json
  def show
  end

  # GET /requests_closures/new
  def new
    @requests_closure = RequestsClosure.new
  end

  # GET /requests_closures/1/edit
  def edit
  end

  # POST /requests_closures
  # POST /requests_closures.json
  def create
    @requests_closure = RequestsClosure.new(requests_closure_params)
    last_requests_closure = RequestsClosure.where(:career_id=>@requests_closure.career_id)[0]
    if last_requests_closure
      last_requests_closure.final_date = @requests_closure.final_date
      @requests_closure = last_requests_closure 
    end

    respond_to do |format|
      if @requests_closure.save
        format.html { redirect_to @requests_closure, notice: 'Requests closure was successfully created.' }
        format.json { render action: 'show', status: :created, location: @requests_closure }
      else
        format.html { render action: 'new' }
        format.json { render json: @requests_closure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests_closures/1
  # PATCH/PUT /requests_closures/1.json
  def update
    respond_to do |format|
      if @requests_closure.update(requests_closure_params)
        format.html { redirect_to @requests_closure, notice: 'Requests closure was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @requests_closure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests_closures/1
  # DELETE /requests_closures/1.json
  def destroy
    @requests_closure.destroy
    respond_to do |format|
      format.html { redirect_to requests_closures_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_requests_closure
      @requests_closure = RequestsClosure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def requests_closure_params
      params.require(:requests_closure).permit(:career_id, :final_date)
    end
end
