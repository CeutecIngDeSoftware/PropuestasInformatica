class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update]


 # GET /users
  # GET /users.json
  def index
    @table_search = params["table_search"]
  	if current_user
      if userIsCoordinator || userIsAssistant
          @users = User.where("name LIKE ?" , "%#{@table_search}%").where.not(:role_id => 2).order("role_id ASC","name ASC")
      elsif userIsAdmin
          @users = User.where("name LIKE ?" , "%#{@table_search}%").order("role_id ASC", "career_id ASC", "name ASC")
		  else 
			  redirect_to requests_path
    end
    else
      redirect_to log_in_path
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

	def edit
	end

	def new
	  @search = User.find_by_id(1)
	  if @search.blank?
		  @user = User.new
	  else
		  if current_user
		  	if !userIsStudent
  	  		@user = User.new
		  	else
		  		redirect_to requests_path
		  	end
		  else
			  redirect_to log_in_path
		  end
	  end
	end

	def create
  	@user = User.new(params[:user])
    @user.avatar = params[:avatar] 
    @user.password = @user.cuenta
    @user.password_confirmation = @user.cuenta
    
    @search = User.find_by_id(1)
    if !@search.blank?
      if current_user.role_id == 1
        @user.career_id = current_user.career_id
      end
    end

 		if @user.save
	    @user.save
  	  redirect_to users_path, :notice => "El usuario ha sido registrado!"
  	else
    	render "new"
  	end
	end

	def update
  	  respond_to do |format|
  	    if @user.update(user_params)
  	      format.html { redirect_to users_path, notice: 'El usuario ha sido actualizado.' }
  	      format.json { head :no_content }
  	    else
  	      format.html { render action: 'edit' }
  	      format.json { render json: @user.errors, status: :unprocessable_entity }
  	    end
  	  end
  end

  def destroy
    @user = User.find_by_id(params[:id])
    if userIsCoordinator && (@user.role_id == 1 || @user.role_id == 2)
			redirect_to requests_path
      return
    end

    if userIsAssistant && (@user.role_id == 1 || @user.role_id == 2 || @user.role_id == 4)
			redirect_to requests_path
      return
    end

    if !userIsStudent
		  @user.destroy
      UserInRequest.where(:user_id=>@user.id).destroy_all
		  respond_to do |format|
		    format.html { redirect_to users_path }
		    format.json { head :no_content }
		  end
		else
			redirect_to requests_path
		end
  end

	private
    # Use callbacks to share common setup or constraints between actions.
		
    def set_user 
		  if !current_user 
	  		redirect_to log_in_path
  		elsif !userIsStudent
        @user = User.find(params[:id])
        if userIsCoordinator
          if @user.career_id == current_user.career_id && @user.role_id != 2
            @user = User.find(params[:id])
          else
            redirect_to users_path
          end
        end
      else
  			u = current_user.id
        @user = User.find(u)
  		end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :cuenta, :telefono, :informacion_adicional, :name, :role_id, :career_id, :avatar)
    end

end
