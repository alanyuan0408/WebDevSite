class UsersController < ApplicationController

  def show
    @currentPage = {:useraccount => "active"};

    if User.exists?(params[:id])
      @user = User.find(params[:id])
      @user_name = @user.name
      @feedbank_posts = Feedbank.where(user_id: @user.id)

      if @user.admin && current_user.remember_token == @user.remember_token
        @post_request = User.where(sent_approval: true).where(content_approved: false).all
        @users = User.where(student_account: true).order("created_at desc")
        @creators = User.where(content_creator: true).order("created_at desc")
        @confirmed_users = User.where(email_confirmation_token: "confirmed").length

        @user_posts = Feedbank.where(approval_status: false).all
        render 'admin_page'

      elsif (!@user.account_selected) && current_user.remember_token == @user.remember_token
        render 'account_select'

      elsif !@user.student_account && @user.content_creator && (!@user.sent_approval) && current_user.remember_token == @user.remember_token
        render 'approve_creator'

      elsif !@user.student_account &&  @user.content_creator && @user.sent_approval && current_user.remember_token == @user.remember_token
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
      sign_in @user
      @currentPage = {:useraccount => "active"};
      @user_name = @user.name
      @user.update_column(:email_confirmation_token, "confirmed")
      render 'users/confirmMail'
    end 
  end

  def request_creator
    @user = User.find_by_id(session[:remember_token])
    @user.update_attribute(:sent_approval, true);
    @user.update_attribute(:content_creator, true);
    @user.update_attribute(:organization, params[:organization]);
    @user.update_attribute(:approval_message, params[:approval_message]);

    @currentPage = {:useraccount => "active"};
    @user_name = @user.name
    redirect_to @user
  end

  def approve_creator 
    @user  = User.find(params[:id])
    @user.update_attribute(:content_approved, true);

    @admin_user = User.find_by_name("Admin");
    redirect_to @admin_user 
  end



end
