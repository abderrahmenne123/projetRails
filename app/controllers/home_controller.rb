class HomeController < ApplicationController
  def index
   # redirect_to (:controller => 'home', :action => 'private')
   @villes = Jobprofile.pluck(:ville).uniq
 @jobs = Jobprofile.pluck(:namejob).uniq
 @jobprofiles = Jobprofile.all.page(params[:page])
    if !params[:mot_cherche].blank?
      @jobprofiles = Jobprofile.page(params[:page]).recherche_mot(params[:mot_cherche])
    end
    if !params[:ville].blank? || !params[:namejob].blank? ||!params[:tarif].blank?
      @jobprofiles = Jobprofile.page(params[:page]).recherche_filter(params[:ville],params[:tarif],params[:namejob])
    end
    @hash = Gmaps4rails.build_markers( @jobprofiles) do |jobprofile, marker|
     marker.lat jobprofile.latitude
     marker.lng jobprofile.langitude
     @info = '<center><h1><i class="fas fa-user-tie"></i></h1></center>'"<strong>Name of Technicien: </strong>""<h6>"+ jobprofile.user.full_name + "</h6>"  +"<strong>""Job of Technicien: ""</strong>"" <h6>" +  jobprofile.namejob +  " </h6>"  +"<strong>" "mobile :" "</strong>"" <h6>" +jobprofile.user.mobile.to_s  + " </h6>"  + "<strong>""Email :" "</strong>"" <h6>" +jobprofile.user.email + " </h6>"
 
 
 
 
 
     marker.infowindow @info
    
  end

  end

  def private
   # resources :users, only: [:new, :index, :show, :edit, :update, :destroy]
   #redirect_to (:controller => 'home', :action =>'home')
   def user_params
    params.require(:jobprofile).permit(
      :mot_cherche,
      :ville,
      :tarif,
      :user_id,
      :namejob,
      :page
    )
   end
  end

end
