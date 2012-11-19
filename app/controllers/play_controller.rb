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
      return
    end
  end

  def board
    @question = Question.where(uid: params[:uid]).first
    @question = Question.first if @question.nil?
    log = Log.where(question_id: @question.id, user_id: session[:user_id]).first
    render :text => 'Invalid access' and return if log.nil?
    @comments = Comment.where(question_id: @question.id)
    @username = User.find(session[:user_id]).username
  end

  def create_comment
    question = Question.where(uid: params[:uid]).first
    log = Log.where(question_id: question.id, user_id: session[:user_id]).first
    render :text => 'Invalid access' and return if log.nil?
    Comment.create(user_id: session[:user_id], question_id: question.id, content: params[:content])
    redirect_to "/play/#{question.uid}/board"
  end

  def remove_comment
    comment = Comment.find(params[:id])
    comment.update_attributes(deleted: true)
    redirect_to "/play/#{params[:uid]}/board"
  end

  private
    def check_authentication
      redirect_to '/user' if session[:user_id].nil?
    end
end
