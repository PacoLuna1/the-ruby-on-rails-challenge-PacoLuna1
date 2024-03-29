# frozen_string_literal: true

# Lists controller
class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list, only: %i[show edit update destroy]

  # GET /lists
  # GET /lists.json
  def index
    @lists = current_user.lists.all
    respond_to do |format|
      format.html
      format.json
      format.csv { send_data @lists.to_csv }
      format.pdf { render template: 'lists/pdf', pdf: 'pdf' }
    end
  end

  # GET /lists/1
  # GET /lists/1.json
  def show; end

  # GET /lists/new
  def new
    @list = current_user.lists.new
  end

  # GET /lists/1/edit
  def edit; end

  # POST /lists
  # POST /lists.json
  def create
    @list = current_user.lists.new(list_params)

    respond_to do |format|
      if @list.save
        format.html do
          redirect_to @list, notice: 'List was successfully created.'
        end
        format.json do
          render :show, status: :created, location: @list
        end
      else
        format.html { render :new }
        format.json do
          render json: @list.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html do
          redirect_to @list, notice: 'List was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json do
          render json: @list.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html do
        redirect_to lists_url, notice: 'List was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_list
    @list = List.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def list_params
    params.require(:list).permit(:title)
  end
end
