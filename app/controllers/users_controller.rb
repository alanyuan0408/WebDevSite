class UsersController < ApplicationController

  def show
    @currentPage = {:useraccount => "active"};

    if User.exists?(params[:id])
      @user = User.find(params[:id])
      @user_name = @user.name

      if @user.admin && current_user.remember_token == @user.remember_token
        @post_request = User.where(sent_approval: true).where(content_approved: false).all
        @users = User.all
        @confirmed_users = User.where(email_confirmation_token: "confirmed").length
        render 'admin_page'

      elsif (!@user.account_selected) && current_user.remember_token == @user.remember_token
        render 'account_select'

      elsif @user.content_creator && (!@user.sent_approval) && current_user.remember_token == @user.remember_token
        render 'approve_creator'

      elsif @user.content_creator && @user.sent_approval && current_user.remember_token == @user.remember_token
        @jobPosts = Item.where(type_of: "JobPost").where(owner: @user.name).all
        render 'content_page'

      elsif @user.student_account && current_user.remember_token == @user.remember_token
          #render the student page
      else
        @user = User.find(params[:id])
        @user_name = "Account Login"
        render 'permissiondenied'
      end
    else
      @user_name = "Account Login"
      render 'permissiondenied'
    end
  end

  def create
    @currentPage = {:useraccount => "active"};
  	@user = User.new(params[:user])
    @user_name = "Account Login"

  	if @user.save
  		#Handle a successful save.

      sign_in @user
  		redirect_to @user
  	else 
      @currentPage = {:usererror => "true"};
  		render 'new'
  	end
  end


  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    @admin_user = User.find_by_name("Admin");
    redirect_to @admin_user 
  end

  def new
    @currentPage = {:useraccount => "active"};
  	@user = User.new
    @user_name = "Account login"
  end

  def edit
    @currentPage = {:useraccount => "active"};
    @user = User.find_by_id(session[:remember_token])
    @user_name = @user.name
  end

  def update
    @currentPage = {:useraccount => "active"};
    @user = User.find_by_id(session[:remember_token])
    @user_name = @user.name

    if @user.update_attributes(params[:user])
        if @user.content_creator
          @user.update_attribute(:sent_approval, true);
        end
        sign_in @user
        redirect_to @user
    else
      @currentPage[:usererror] = "true"
      render 'edit'
    end
  end

  def register_expo
    @user = User.find_by_id(session[:remember_token])
    @user.update_attribute(:expo_ticket, true);
    @currentPage = {:entrepreneur => "active"};
    @user_name = @user.name
    @number_of_participants = User.where(:expo_ticket => true).length;
    render 'static_pages/entrepreneur'
  end 

  def unregister_expo
    @user = User.find_by_id(session[:remember_token])
    @user.update_attribute(:expo_ticket, false);
    @currentPage = {:entrepreneur => "active"};
    @user_name = @user.name
    @number_of_participants = User.where(:expo_ticket => true).length;
    render 'static_pages/entrepreneur'
  end 

  def student_account
    @user = User.find_by_id(session[:remember_token])
    @user.update_attribute(:student_account, true);
    @user.update_attribute(:account_selected, true);
    @currentPage = {:useraccount => "active"};
    @user_name = @user.name
    redirect_to @user
  end

  def creator_account
    @user = User.find_by_id(session[:remember_token])
    @user.update_attribute(:content_creator, true);
    @user.update_attribute(:account_selected, true);
    @currentPage = {:useraccount => "active"};
    @user_name = @user.name
    redirect_to @user
  end

  def confirmation_token
    @user = User.find_by_email_confirmation_token(params[:email_confirmation_token]);

    if @user.blank?
      render 'permissiondenied'
    else 
      @currentPage = {:useraccount => "active"};
      @user_name = @user.name
      @user.update_column(:email_confirmation_token, "confirmed")
      render 'users/confirmMail'
    end 
  end 
end
