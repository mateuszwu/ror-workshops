class TeamsController < ApplicationController
  def index
    @rounds = Round.all
  end

  def show
    @round = Round.find(params[:id])
  end


  def new
    @round = Round.new
  end


  def create
    @round = Team.new(params[:team])
    if @round.save
      redirect_to @round
    else
      render :action => 'new'
    end
  end


  def edit
    @round = Team.find(params[:id])
  end


  def update
    @round = Team.find(params[:id])
    if @round.update_attributes(params[:team])
      redirect_to @round
    else
      render :action => 'edit'
    end
  end


  def destroy
    @round = Round.find(params[:id])
    @round.destroy
    redirect_to rounds_url
  end

end