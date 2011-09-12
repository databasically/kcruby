class MembersController < ApplicationController
  def index
    @members = Member.find(:all, :order => 'ruby_since')
  end

  def show
    @member = Member.find(params[:id])
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(params[:member])
    if @member.save
      redirect_to @member, :notice => "Successfully created member"
    else
      render :action => 'new'
    end
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update_attributes(params[:member])
      redirect_to members_url, :notice  => "Successfully updated member"
    else
      render :action => 'edit'
    end
  end

  def destroy    
    session[:member_id] = nil unless current_member.admin
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to members_url, :notice => "Successfully deleted member"
  end
end
