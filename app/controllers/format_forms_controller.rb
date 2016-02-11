class FormatFormsController < ApplicationController
  before_action :set_format_form, only: [:show, :edit, :update, :destroy]
  before_filter :session_filter, :only => [:show, :index, :new, :update, :destroy]
  layout 'admin'
  # GET /format_forms
  # GET /format_forms.json
  def index
    @format_forms = FormatForm.all
  end

  # GET /format_forms/1
  # GET /format_forms/1.json
  def show
    @format_form = FormatForm.find(params[:id])
  end

  def view_action
    @format_form = FormatForm.find(params[:id])
    render layout: 'application'
  end

  def printing_view_format
    require 'barby'
    require 'barby/barcode/code_128'
    require 'barby/outputter/png_outputter'
    require 'barby/outputter/ascii_outputter'
    require 'barby/outputter/html_outputter'
    @response = QuestionResponse.where(form_sender: params[:form_sender]).first
    @form = @response.question.format_form
    @questions = @form.questions
    @barcode = Barby::Code128B.new("http://www.capama.gob.mx/printing_view_format?form_sender=#{params[:form_sender]}")
    @barcode_for_html = Barby::HtmlOutputter.new(@barcode)
    puts @barcode
    puts @barcode.to_ascii
   

    render layout: 'application'
  end

  # GET /format_forms/new
  def new
    @format_form = FormatForm.new
  end

  # GET /format_forms/1/edit
  def edit
    @format_form = FormatForm.find(params[:id])
  end

  # POST /format_forms
  # POST /format_forms.json
  def create
    @format_form = FormatForm.new(format_form_params)

    respond_to do |format|
      if @format_form.save
        format.html { redirect_to @format_form, notice: 'Format form was successfully created.' }
        format.json { render :show, status: :created, location: @format_form }
      else
        format.html { render :new }
        format.json { render json: @format_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /format_forms/1
  # PATCH/PUT /format_forms/1.json
  def update
    respond_to do |format|
      if @format_form.update(format_form_params)
        format.html { redirect_to @format_form, notice: 'Format form was successfully updated.' }
        format.json { render :show, status: :ok, location: @format_form }
      else
        format.html { render :edit }
        format.json { render json: @format_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /format_forms/1
  # DELETE /format_forms/1.json
  def destroy
    @format_form.destroy
    respond_to do |format|
      format.html { redirect_to format_forms_url, notice: 'Format form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_format_form
      @format_form = FormatForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def format_form_params
      params.require(:format_form).permit(:title, :description, :public, questions_attributes: [:qtag, :qtype, :qclass, question_options_attributes: [:qotag, :qovalue]])
    end

    def session_filter
     if session[:user] == nil
        redirect_to login_user_path
     end
    end
end
