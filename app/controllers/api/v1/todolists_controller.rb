class Api::V1::TodolistsController < ApplicationController
  before_action :set_todolist, only: %i[ show update destroy ]

  # GET /todolists
  def index
    @todolists = Todolist.all

    render json: @todolists
  end

  # GET /todolists/1
  def show
    render json: @todolist
  end

  # POST /todolists
  def create
    @todolist = Todolist.new(todolist_params)

    if @todolist.save
      render json: @todolist, status: :created, location: @todolist
    else
      render json: @todolist.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /todolists/1
  def update
    if @todolist.update(todolist_params)
      render json: @todolist
    else
      render json: @todolist.errors, status: :unprocessable_entity
    end
  end

  # DELETE /todolists/1
  def destroy
    @todolist.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todolist
      @todolist = Todolist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todolist_params
      params.require(:todolist).permit(:title, :body)
    end
end
