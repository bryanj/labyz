# encoding: utf-8
class UserController < ApplicationController
  def index
    redirect_to '/' if session[:user_id]
  end

  def login
    user = User.where(username: params[:username]).first
    if user and user.password? params[:password]
      session[:user_id] = user.id
      session[:username] = user.username
    end
    redirect_to '/'
  end

  def logout
    session[:user_id] = nil
    redirect_to '/'
  end

  def join
  end

  def create
    if User.where(username: params[:username]).count>0
      flash[:error] = '이미 존재하는 사용자명입니다.'
      render :action => :join and return
    elsif params[:password] != params[:confirm]
      flash[:error] = '비밀번호와 확인이 일치하지 않습니다.'
      render :action => :join and return
    end
    user = User.new(username: params[:username])
    user.password_salt = [Array.new(6) {rand(256).chr}.join].pack("m").chomp[0..7]
    user.password_hash = Digest::SHA2.hexdigest(user.password_salt + params[:password])
    user.save
    redirect_to '/'
  end
end
