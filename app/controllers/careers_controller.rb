class CareersController < ApplicationController
  before_action :set_career, only: [:show, :edit, :update, :destroy]

  # GET /careers
  # GET /careers.json
  def index
		if current_user
		if current_user.role_id == 2
    @careers = Career.all
		else
			redirect_to requests_path
		end
		else
		redirect_to log_in_path
		end
  end

  # GET /careers/1
  # GET /careers/1.json
  def show
  end

  # GET /careers/new
  def new
		if current_user
		if current_user.role_id == 2
    @career = Career.new
		else
			redirect_to requests_path
		end
		else
		redirect_to log_in_path
		end
  end

  # GET /careers/1/edit
  def edit
  end

  # POST /careers
  # POST /careers.json
  def create
		if current_user.role_id == 2
    @career = Career.new(career_params)

    respond_to do |format|
      if @career.save
        format.html { redirect_to @career, notice: 'La carrera fue creada.' }
        format.json { render action: 'show', status: :created, location: @career }
      else
        format.html { render action: 'new' }
        format.json { render json: @career.errors, status: :unprocessable_entity }
      end
    end
		else
			redirect_to requests_path
		end
  end

  # PATCH/PUT /careers/1
  # PATCH/PUT /careers/1.json
  def update
		if current_user.role_id == 2
    respond_to do |format|
      if @career.update(career_params)
        format.html { redirect_to @career, notice: 'La carrera fue actualizada.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @career.errors, status: :unprocessable_entity }
      end
    end
		else
			redirect_to requests_path
		end
  end

  # DELETE /careers/1
  # DELETE /careers/1.json
  def destroy
		if current_user.role_id == 2
    @career.destroy
    respond_to do |format|
      format.html { redirect_to careers_url }
      format.json { head :no_content }
    end
		else
			redirect_to requests_path
		end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_career
			if current_user
      @career = Career.find(params[:id])
		else
			redirect_to log_in_path
		end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def career_params
      params.require(:career).permit(:name)
    end
end
