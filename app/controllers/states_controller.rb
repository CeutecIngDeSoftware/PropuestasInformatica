class StatesController < ApplicationController
  before_action :set_state, only: [:show, :edit, :update, :destroy]

  # GET /states
  # GET /states.json
  def index
	if current_user
		if current_user.role_id == 2
	    @states = State.all
		else
			redirect_to requests_path
		end
	else
		redirect_to log_in_path
	end
  end

  # GET /states/1
  # GET /states/1.json
  def show
  end

  # GET /states/new
  def new
	if current_user
		if current_user.role_id == 2
	    @state = State.new
		else
			redirect_to requests_path
		end
	else
		redirect_to log_in_path
	end
  end

  # GET /states/1/edit
  def edit
  end

  # POST /states
  # POST /states.json
  def create
		if current_user.role_id == 2
		  @state = State.new(state_params)

		  respond_to do |format|
		    if @state.save
		      format.html { redirect_to @state, notice: 'El estado fue creado exitosamente.' }
		      format.json { render action: 'show', status: :created, location: @state }
		    else
		      format.html { render action: 'new' }
		      format.json { render json: @state.errors, status: :unprocessable_entity }
		    end
		  end
		else
			redirect_to requests_path
		end
  end

  # PATCH/PUT /states/1
  # PATCH/PUT /states/1.json
  def update
		if current_user.role_id == 2
		  respond_to do |format|
		    if @state.update(state_params)
		      format.html { redirect_to @state, notice: 'El estado ha sido actualizado.' }
		      format.json { head :no_content }
		    else
		      format.html { render action: 'edit' }
		      format.json { render json: @state.errors, status: :unprocessable_entity }
		    end
		  end
		else
			redirect_to requests_path
		end
  end

  # DELETE /states/1
  # DELETE /states/1.json
  def destroy
		if current_user.role_id == 2
		  @state.destroy
		  respond_to do |format|
		    format.html { redirect_to states_url }
		    format.json { head :no_content }
		  end
		else
			redirect_to requests_path
		end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_state
			if current_user
      @state = State.find(params[:id])
			else
			redirect_to log_in_path
			end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def state_params
      params.require(:state).permit(:name)
    end
end
