class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]

def rooturl
	redirect_to requests_path
end

  # GET /requests
  # GET /requests.json
  def index
    #if User.where(role_id:1).count > 0
    @table_search1 = params["table_search1"]
    @table_search2 = params["table_search2"]

      if current_user
        @propuestas_iniciales=[]
        User.where(role_id:1,career_id: current_user.career_id).each do |user|
          UserInRequest.where(user_id:user.id).each do |uir|
            @propuestas_iniciales.push(uir)
          end
        end

        @propuestas_alumnos=[]
        Request.joins(:course).where("courses.name LIKE ?" , "%#{@table_search2}%").each do |request|
          if request.course.career == current_user.career
            es_inicial = false
            UserInRequest.where(request_id: request.id).each do |uir|
              User.where(role_id:1).each do |u|
                if uir.user_id == u.id
                  es_inicial = true
                end
              end
            end
            if es_inicial == false
              @propuestas_alumnos.push(request)
            end
          end
        end

      else
        @propuestas_iniciales=[]
        User.where(role_id:1).order("career_id ASC").each do |user|
          UserInRequest.where(user_id:user.id).each do |uir|
            @propuestas_iniciales.push(uir)
          end
        end

        @propuestas_alumnos = []
          Request.joins(:course).where("courses.name LIKE ?" , "%#{@table_search2}%").all.each do |request|
            es_inicial = false
            UserInRequest.where(request_id: request.id).each do |uir|
              User.where(role_id:1).each do |u|
                if uir.user_id == u.id
                  es_inicial = true
                end
              end
            end
            if es_inicial == false
              @propuestas_alumnos.push(request)
            end
         end
      end

# si el usuario es admin puede ver todos los requests
       if current_user && current_user.role_id == 2
         @propuestas_iniciales=[]
         User.where(role_id:1).order("career_id ASC").each do |user|
           UserInRequest.where(user_id:user.id).each do |uir|
             @propuestas_iniciales.push(uir)
           end
         end

         @propuestas_alumnos = []
          Request.joins(:course).where("courses.name LIKE ?" , "%#{@table_search2}%").all.each do |request|
            es_inicial = false
            UserInRequest.where(request_id: request.id).each do |uir|
              User.where(role_id:1).each do |u|
                if uir.user_id == u.id
                  es_inicial = true
                end
              end
            end
            if es_inicial == false
              @propuestas_alumnos.push(request)
            end
          end
        end

    #else
    #  @propuestas_iniciales = []
    #  @propuestas_alumnos = []
    #end
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    if current_user
      @request = Request.new
      @courses = Course.where(career_id: current_user.career_id)
    else
      redirect_to log_in_path
    end
  end

  # GET /requests/1/edit
  def edit
  end

	def yaEstoyInscrito course_id
		if current_user.role_id != 1
		clases = UserInRequest.where(:user_id => current_user.id)
		clases.each do|clase|
			if Request.find_by_id(clase.request_id).course_id == course_id
				return true
			end
		end
		end
		return false  
	end	

	def yaEstoyInscritoHorario schedule_id
		if current_user.role_id != 1
		clases = UserInRequest.where(:user_id => current_user.id)
		clases.each do|clase|
			if Request.find_by_id(clase.request_id).schedule_id == schedule_id
				return true
			end
		end
		end
		return false  
	end	

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)
		@request.state_id = 1
    respond_to do |format|

			#Ya hay una request
  		if Request.where(:course_id => @request.course_id, :schedule_id => @request.schedule_id).count != 0
				#El usuario ya es parte de la request
				temp = Request.where(:course_id => @request.course_id, :schedule_id => @request.schedule_id)[0]
  			if UserInRequest.where(:user_id => current_user.id, :request_id => temp.id).count == 0
  				ur = UserInRequest.new
  	      ur.user_id = current_user.id
  	      ur.request_id = temp.id
  				ur.save
	        format.html { redirect_to "/requests", notice: 'Registrado con exito.' }
  			else
	        format.html { redirect_to "/requests/new", notice: 'Ya estabas registrado.' }
        end
			#No hay una request
			elsif yaEstoyInscrito @request.course_id
						format.html { redirect_to "/requests/new", notice: 'Ya estas registrado con la misma clase a otra hora, borra tu otro registro y prueba de nuevo.' }
			
			elsif yaEstoyInscritoHorario @request.schedule_id
						format.html { redirect_to "/requests/new", notice: 'Ya estas registrado a esa hora con otra clase, borra tu otro registro y prueba de nuevo.'}			

  		elsif @request.save
				ur = UserInRequest.new
        ur.user_id = current_user.id
        ur.request_id = @request.id
				ur.save
        format.html { redirect_to @request, notice: 'La propuesta fue creada exitosamente.' }
        format.json { render action: 'show', status: :created, location: @request }
      else
        format.html { render action: 'new' }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
  if !userIsStudent
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'La propuesta ha sido actualizada.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
   else
    redirect_to requests_path
   end
  end


  def cambioestado
    @temp = params[:request_id]
    r = Request.find(@temp)
    if !userIsStudent
        if r.state_id == 1
          r.state_id = 2
          r.save
			    redirect_to requests_path
        elsif r.state_id == 2
          r.state_id = 3
          r.save
          redirect_to requests_path
        else
          r.state_id = 1
          r.save
          redirect_to requests_path
        end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.user_in_requests.each do |uir|
      uir.destroy
      uir.save
    end
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url }
      format.json { head :no_content }
    end
  end

  def registrarme
		@schedule_id = params[:schedule_id]
		@course_id = params[:course_id]
		@request_id = params[:request_id]
		@request = Request.find_by_id(@request_id)
		if @request.state.id == 3
      respond_to do |format|
  			format.html { redirect_to "/requests/", notice: 'Error la Clase esta Cancelada' }
      end
			return
		end
		if ( (yaEstoyInscrito (@course_id.to_i))	|| (yaEstoyInscritoHorario(@schedule_id.to_i)) )
			respond_to do |format|
  	  	format.html { redirect_to "/requests/", notice: 'Ya estas Registrado a esa Hora o en ese Curso!' }
			end
		else
	   	uir = UserInRequest.new
 	  	uir.user_id = current_user.id
 	  	uir.request_id = @request_id
 	  	uir.save
			respond_to do |format|
  	  	format.html { redirect_to "/requests/", notice: 'Registrado Exitosamente' }
			end
    end
  end

	def quitarme
		@request_id = params[:request_id]
		u = UserInRequest.where(:user_id => current_user.id, :request_id => @request_id)[0]
		if u != nil
		u.destroy
		u.save
		end
		redirect_to "/requests/", notice: 'Quitado de la propuesta'
	end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
	if current_user
	  @request = Request.find(params[:id])
  	  if userIsAdmin || userIsCoordinator
          if userIsCoordinator
            if @request.course.career_id == current_user.career_id
              @request = Request.find(params[:id])
            else
              redirect_to requests_path
            end
          end
        end
			else
			redirect_to log_in_path
			end
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:course_id, :schedule_id, :state_id)
    end
end
