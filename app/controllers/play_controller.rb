class PlayController < ApplicationController

  before_filter :check_authentication

  def index
    @question = Question.where(uid: params[:uid]).first
    @question = Question.first if @question.nil?
    log = Log.where(question_id: @question.id, user_id: session[:user_id]).first
    render :text => 'Invalid access' and return if log.nil?
  end

  def list
    @worlds = World.all
  end

  def move
    @worlds = World.all
    @logs = Log.where(user_id: session[:user_id])
  end

  def solve
    answer = params[:answer]
    answer = params[:link] if params[:link] != ""
    link = Link.where(question_id: params[:question_id], answer: answer).first
    if link
      Log.create(world_id: link.question.world_id, question_id: link.next_question.id, user_id: session[:user_id]) if Log.where(question_id: link.next_question.id, user_id: session[:user_id]).empty?
      redirect_to '/play/' + link.next_question.uid
    else
      redirect_to '/play/' + Question.find(params[:question_id]).uid
    end
  end

  private
    def check_authentication
      redirect_to '/user' if session[:user_id].nil?
    end
end
