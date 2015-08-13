class GroupsController < ApplicationController
  before_action :set_step, only: [:create, :new]

  def new
    if session[:user_id].nil?
      @user = User.new
      @user.save
      session[:user_id]   = @user.id
    end
    @random = rand(1..5)
    session[:group_id]  = params[:group_id]
  end


  def show
    @choices = Choice.where(group_id: params[:group_id]).group(:user_id)
  end

  def create

    @choice = Choice.new(group_id: session[:group_id], user_id: session[:user_id], user_choice: params[:type], step_id: session[:step], round_id: 1)
    @choice.save
    
    session[:step] = session[:step] + 1

    redirect_to start_path(group_id: session[:group_id])
  end

  def user_show
    @choices = Choice.where(group_id: params[:group_id], user_id: params[:user_id])
  end
  
  private

  def set_step
    if session[:step].present?
      @step = session[:step]
    else
      @step = 1
    end
  end
end
