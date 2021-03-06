class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @table_search = params["table_search"]
		if current_user
		if current_user.role_id == 1
    	@courses = Course.where("name LIKE ?" , "%#{@table_search}%").where(career_id: current_user.career_id).all
    elsif current_user.role_id == 2
      @courses = Course.all.where("name LIKE ?" , "%#{@table_search}%").order("career_id ASC")
		else
			redirect_to requests_path
		end
		else
		redirect_to log_in_path
		end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
		if current_user
		if current_user.role_id == 1 || current_user.role_id == 2
    	@course = Course.new
		else
			redirect_to requests_path
		end
		else
		redirect_to log_in_path
		end
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
		if current_user.role_id == 1 || current_user.role_id == 2
		  @course = Course.new(course_params)
      
      if current_user.role_id == 1
      @course.career_id = current_user.career_id
      end

		  respond_to do |format|
		    if @course.save
		      format.html { redirect_to @course, notice: 'La clase fue creada exitosamente.' }
		      format.json { render action: 'show', status: :created, location: @course }
		    else
		      format.html { render action: 'new' }
		      format.json { render json: @course.errors, status: :unprocessable_entity }
		    end
		  end
		else
			redirect_to requests_path
		end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
		if current_user.role_id == 1 || current_user.role_id == 2
		  respond_to do |format|
		    if @course.update(course_params)
		      format.html { redirect_to @course, notice: 'La clase ha sido actualizada.' }
		      format.json { head :no_content }
		    else
		      format.html { render action: 'edit' }
		      format.json { render json: @course.errors, status: :unprocessable_entity }
		    end
		  end
		else
			redirect_to requests_path
		end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
		if userIsAdmin || userIsCoordinator
      @course.requests.each do |r|
        r.user_in_requests.each do |uir|
          uir.destroy
          uir.save
        end
        r.destroy
        r.save
      end
		  @course.destroy
		  respond_to do |format|
		    format.html { redirect_to courses_url }
		    format.json { head :no_content }
		  end
		else
			redirect_to requests_path
		end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
			if current_user
  		  if userIsAdmin || userIsCoordinator
          @course = Course.find(params[:id])
          if userIsCoordinator
            if @course.career_id == current_user.career_id
              @course = Course.find(params[:id])
            else
              redirect_to courses_path
            end
          end
        end
			else
			redirect_to log_in_path
			end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :requirements, :recommended_requirements, :career_id)
    end
end
