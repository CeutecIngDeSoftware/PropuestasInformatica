class RolesController < ApplicationController
  before_action :set_role, only: [:show, :edit, :update, :destroy]

  # GET /roles
  # GET /roles.json
  def index
		if current_user
		if current_user.role_id == 1 || current_user.role_id == 2
    @roles = Role.all
		else
			redirect_to requests_path
		end
		else
		redirect_to log_in_path
		end
  end

  # GET /roles/1
  # GET /roles/1.json
  def show
  end

  # GET /roles/new
  def new
		if current_user
		if current_user.role_id == 1 || current_user.role_id == 2
    @role = Role.new
		else
			redirect_to requests_path
		end
		else
		redirect_to log_in_path
		end
  end

  # GET /roles/1/edit
  def edit
  end

  # POST /roles
  # POST /roles.json
  def create
		if current_user.role_id == 1 || current_user.role_id == 2
    @role = Role.new(role_params)

    respond_to do |format|
      if @role.save
        format.html { redirect_to @role, notice: 'El rol fue creado.' }
        format.json { render action: 'show', status: :created, location: @role }
      else
        format.html { render action: 'new' }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
		else
			redirect_to requests_path
		end
  end

  # PATCH/PUT /roles/1
  # PATCH/PUT /roles/1.json
  def update
		if current_user.role_id == 1 || current_user.role_id == 2
    respond_to do |format|
      if @role.update(role_params)
        format.html { redirect_to @role, notice: 'El rol fue actualizado.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
		else
			redirect_to requests_path
		end
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
		if current_user.role_id == 1 || current_user.role_id == 2
    @role.destroy
    respond_to do |format|
      format.html { redirect_to roles_url }
      format.json { head :no_content }
    end
		else
			redirect_to requests_path
		end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role
			if current_user
      @role = Role.find(params[:id])
		else
			redirect_to log_in_path
		end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def role_params
      params.require(:role).permit(:name)
    end
end
