class ReviewController < ApplicationController

  attr_accessor :admin


  def index
  	@style = params[:view_style]
  	if (@style == nil) 
  		@style = "block"
  	end
  	if logged_in?
  	  begin
        @user = User.find(session[:user_id])
        @admin = @user.admin
      rescue ActiveRecord::RecordNotFound => e
        @user = User.create(:name => "Nil", :email => "nil@nil.edu", :password => "nil", :phone => "nil", :admin => false)
      end
      @admin = @user.admin
  	else
  	  @admin = false
  	end

    #@artworks = Artwork.where(:approved => nil)
    @artworks = Artwork.all
  end

  def update
    if logged_in?
      begin
        @user = User.find(session[:user_id])
        if @user.admin
          @id = params[:id]
          @artwork = Artwork.find(@id)
          @artwork.startingprice = params[:startingprice]
          @artwork.autowinprice = params[:autowinprice]
          @artwork.approved = true

          curr_year = Date.today.year

          if (params[:ampm] == "PM") 
            params[:hour] = params[:hour].to_i + 12
          end

          date = '' + curr_year.to_s + '-' + params[:month] + '-' + params[:day] + ' ' + params[:hour].to_s + ':' + params[:minute]
          startdate = Time.parse(date)
          enddate = startdate + params[:duration].to_i.minutes
          
          @artwork.expiretime = enddate;
          @artwork.opentime = startdate;

          if (startdate < Time.now && enddate > Time.now)
            @artwork.openbid = true
          else
            @artwork.openbid = false
          end

          if @artwork.save!
            flash[:info] = "Artwork approved!"
            redirect_to review_index_path
          else
            flash[:info] = "Artwork was not updated"
          end
        end
      rescue ActiveRecord::RecordNotFound => e
        
      end
    end
  end

  def show

  end




end
