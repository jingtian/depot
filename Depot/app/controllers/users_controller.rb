class UsersController < ApplicationController
 
  #before_filter Proc.new{|controller|controller.permission_required(User.find(controller.session[:user_id]), :add_user)}, :except => [:login]
  before_filter Proc.new{|controller|controller.role_required(User.find(controller.session[:user_id]), "admin")}, :except => [:login]

  # GET /users
  # GET /users.xml
  def index
    @users = User.find(:all, :order => :name)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        flash[:notice] = "User #{@user.name} was successfully created."
        format.html { redirect_to(:action=>:index) }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = "User #{@user.name} was successfully updated."
        format.html { redirect_to(:action=>:index) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    begin
      if @user.eql?(User.find(session[:user_id]))      #you can't delete yourself!
        flash[:notice] = "You can't delete youself."
      else
        @user.destroy
        flash[:notice] = "User #{@user.name} deleted."
      end
    rescue Exception => e
      flash[:notice] = e.message
    end

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end

  def grant_role
    # to do....
  end

  def save_role
    @user = User.find(params[:id])    
#        render :text => params.inspect and return
#        @roles = Role.find(params[:name]) do |r|
#          if r.eql?(params[:role][:name])
#            flash[:notice] = "The user has the role!"
#            indirect_to :back
#          end
#        end


        @user.plays params[:role][:name].to_sym           #grant the user  !
        if @user.save
          flash[:notice] ="success..."
          redirect_to(:action => :index)
        end
      end
   # end
 # end
end

