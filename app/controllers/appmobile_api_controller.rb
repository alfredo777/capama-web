class AppmobileApiController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def login
    @user = User.find_by_card(params[:card])

    unless @user.nil?
       password = corroborate_password(params[:password], "#{@user.password}")
    else
       password = false
    end
    
    if password 
       render json: @user.to_json, callback: params[:callback]
    else
       render json: "Error al ingresar al usuario".to_json, callback: params[:callback]
    end
  end
  
  def call_all_routes
    user = User.find_by_card(params[:card])
    reading_t = user.reading_assignments.last
    @readings = reading_t.reading_takes_waters

    render json: @readings.to_json, callback: params[:callback]
  end

  def call_all_inspects
    user = User.find_by_card(params[:card])
    reading_t = user.user_inspects.last
    @inspects = reading_t.inspects

    render json: @inspects.to_json, callback: params[:callback]
  end

  def sincronize_routes
    @reading = ReadingTakesWater.find(params[:id])
    @reading.reference = params[:reference]
    @reading.observations = params[:observations]
    @reading.abnormalities = params[:abnormalities]
    @reading.lecture = params[:lecture]
    @reading.data_access = params[:data_access].to_s
    @reading.save

    @images = CelphoneImages.where(imageable_id: @reading.id, imageable_type: "routes")
    @images.each do |i|
      i.destroy
    end

    render json: @readings.to_json, callback: params[:callback]
  end
   
  def images
    @images = CelphoneImages.new
    @images.img = params[:file] 
    @images.imageable_id = params[:imageable_id].to_i
    @images.imageable_type = params[:imageable_type].to_s
    @images.save

    render json: @images.to_json, callback: params[:callback]
  end
  
  def json_insert
    img = params[:images]
    parsed_json = ActiveSupport::JSON.decode(img)
    puts parsed_json[:image]
    #imgecode = Base64.decode64(parsed_json["image"])
    #puts imgecode
    #@images = CelphoneImages.new
    #@images.img = imgecode
    #@images.imageable_id = parsed_json.imageable_id.to_i
    #@images.imageable_type = parsed_json.imageable_type.to_s
    #@images.save
    render json: "Enviado".to_json, callback: params[:callback]
  end 

  def sincronize_user_helps
   @user_help = UserHelp.create(cause: params[:cause],explanation: params[:explanation],area: params[:area], phone: params[:phone])
   render json: @user_help.to_json, callback: params[:callback]
  end

  def sincronize_inspects
    @inspect = Inspect.find(params[:id])
    @update_inspect = @inspect.update_attributes(name: params[:name], address: params[:address], inconforme: params[:inconforme], acount: params[:acount], meter: params[:meter], t_ser: params[:t_ser], additional_data: params[:additional_data], date: params[:date], visit_date: params[:visit_date], general_inspect: params[:general_inspect], shooting_conditions: params[:shooting_conditions], home_room: params[:home_room], number_of_people: params[:number_of_people], ordeno_prueba_de_inspeccion: params[:ordeno_prueba_de_inspeccion], property_activity: params[:property_activity], anomalies: params[:anomalies], meter_conditions: params[:meter_conditions], additional_report: params[:additional_report], meter_anomaly: params[:meter_anomaly], in_charge: params[:in_charge], other_obs: params[:other_obs] )
    render json: @update_inspect.to_json, callback: params[:callback]
  end

  def sincronize_serivices_contracts
    @create_contract = ServiceContract.create(drinking_water: params[:drinking_water], sewage_system: params[:sewage_system], acount: params[:acount], meter: params[:meter], diameter: params[:diameter], applicant_name: params[:applicant_name], address: params[:address], colony: params[:colony], phone: params[:phone], bussiness_name: params[:bussiness_name], rfc: params[:rfc], commercial_bussines: params[:commercial_bussines], legal_representative: params[:legal_representative], type_service: params[:type_service], legal_title: params[:legal_title])
    render json: @create_contract.to_json, callback: params[:callback]
  end

private
protected
  def corroborate_password(password, pass)
    sha256 = Digest::SHA256.new
    @digest = sha256.update password.to_s
    puts @digest
    puts pass
    if "#{@digest}" == pass
      puts true
      true
    else
      puts false
      false
    end
  end
end
