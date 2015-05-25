class RegEventsController < ApplicationController
  
  layout 'reg_event'

  respond_to :html, :js  


  def index

    # redirect_to '/new'
    
    # respond_to do |format|
      # format.html
      # format.js
    # end

  end


  def new
    @reg_event = RegEvent.new
    
    respond_to do |format|
      format.html
      format.js
    end

  end


  def create

    @reg_event = RegEvent.new(reg_event_params)
    
    reg_event = @reg_event

    type_affiliation = reg_event.type_affiliation

    case type_affiliation  
      when "1"
        reg_event.type_affiliation = "School/District"
      when "2"
        reg_event.type_affiliation = "Company"
      when "3"
        reg_event.type_affiliation = "OTHER"
      else
        #        
    end

    # 1  Phoenix, AZ        Jan 14 
    # 2  Seattle, WA        Jan 28
    # 3  Atlanta, GA        Feb 10
    # 4  Denver, CO         Feb 19
    # 5  Fresno, CA         Mar 4
    # 6  Minneapolis, MN    Mar 12
    # 7  Los Angeles, CA    Mar 24
    # 8  Charlotte, NC      Apr 16
    # 9  Chicago, IL        Apr 23
    # 10 Houston, TX        Apr 29
    # 11 Richmond, VA       May 14
    # 12 Memphis, TN        May TBD
    # 13 Tampa, FL          Sep 17
    # 14 Dallas, TX         Sep 19
    # 15 Newark, NJ         Sep 23
    # 16 San Jose, CA       Sep 30
    # 17 Kansas City, MO    Oct 7   (IA, NE, KS)
    # 18 Boston, MA         Oct 15
    # 19 Santa Fe, NM       Oct 26-27
    

    # 1  Phoenix, AZ        Jan 14     
    if reg_event.city_workshop_1
      reg_event.city_workshop_1_text = 'Phoenix, AZ'
          # case reg_event.city_workshop_1_session
            # when 1
               # reg_event.city_workshop_1_session_text = "8:30am-3:30pm"
            # when 2
               # reg_event.city_workshop_1_session_text = "4-6:30pm"
            # when 3
               # reg_event.city_workshop_1_session_text = "Full Day"
            # else
             # # 
          # end
    else
      reg_event.city_workshop_1_text = ''
      # reg_event.city_workshop_1_session_text = ''      
    end 

    # 2  Seattle, WA        Jan 28
    if reg_event.city_workshop_2
      reg_event.city_workshop_2_text = 'Seattle, WA'
    else
      reg_event.city_workshop_2_text = ''
    end 
    
    # 3  Atlanta, GA        Feb 10    
    if reg_event.city_workshop_3
      reg_event.city_workshop_3_text = 'Atlanta, GA'
    else
      reg_event.city_workshop_3_text = ''
    end 

    # 4  Denver, CO         Feb 19
    if reg_event.city_workshop_4
      reg_event.city_workshop_4_text = 'Denver, CO'
    else
      reg_event.city_workshop_4_text = ''
    end 

    # 5  Fresno, CA         Mar 4
    if reg_event.city_workshop_5
      reg_event.city_workshop_5_text = 'Fresno, CA'
    else
      reg_event.city_workshop_5_text = ''
    end 

    # 6  Minneapolis, MN    Mar 12
    if reg_event.city_workshop_6
      reg_event.city_workshop_6_text = 'Minneapolis, MN'
    else
      reg_event.city_workshop_6_text = ''
    end 

    # 7  Los Angeles, CA    Mar 24
    if reg_event.city_workshop_7
      reg_event.city_workshop_7_text = 'Los Angeles, CA'
    else
      reg_event.city_workshop_7_text = ''
    end 

    # 8  Charlotte, NC      Apr 16
    if reg_event.city_workshop_8
      reg_event.city_workshop_8_text = 'Charlotte, NC'
    else
      reg_event.city_workshop_8_text = ''
    end 

    # 9  Chicago, IL        Apr 23
    if reg_event.city_workshop_9
      reg_event.city_workshop_9_text = 'Chicago, IL'
    else
      reg_event.city_workshop_9_text = ''
    end 

    # 10 Houston, TX        Apr 29
    if reg_event.city_workshop_10
      reg_event.city_workshop_10_text = 'Houston, TX'
    else
      reg_event.city_workshop_10_text = ''
    end 

    # 11 Richmond, VA       May 14
    if reg_event.city_workshop_11
      reg_event.city_workshop_11_text = 'Richmond, VA'
    else
      reg_event.city_workshop_11_text = ''
    end 

    # 12 Memphis, TN        May TBD
    if reg_event.city_workshop_12
      reg_event.city_workshop_12_text = 'Memphis, TN'
    else
      reg_event.city_workshop_12_text = ''
    end 

    # 13 Tampa, FL          Sep 17
    if reg_event.city_workshop_13
      reg_event.city_workshop_13_text = 'Tampa, FL'
    else
      reg_event.city_workshop_13_text = ''
    end 

    # 14 Dallas, TX         Sep 19
    if reg_event.city_workshop_14
      reg_event.city_workshop_14_text = 'Dallas, TX'
    else
      reg_event.city_workshop_14_text = ''
    end 

    # 15 Newark, NJ         Sep 23
    if reg_event.city_workshop_15
      reg_event.city_workshop_15_text = 'Newark, NJ'
    else
      reg_event.city_workshop_15_text = ''
    end 

    # 16 San Jose, CA       Sep 30
    if reg_event.city_workshop_16
      reg_event.city_workshop_16_text = 'San Jose, CA'
    else
      reg_event.city_workshop_16_text = ''
    end 

    # 17 Kansas City, MO    Oct 7   (IA, NE, KS)
    if reg_event.city_workshop_17
      reg_event.city_workshop_17_text = 'Kansas City, MO (IA, NE, KS)'
    else
      reg_event.city_workshop_17_text = ''
    end 

    # 18 Boston, MA         Oct 15
    if reg_event.city_workshop_18
      reg_event.city_workshop_18_text = 'Boston, MA'
    else
      reg_event.city_workshop_18_text = ''
    end 

    # 19 Albuquerque, NM    Oct 26-27
    if reg_event.city_workshop_19
      reg_event.city_workshop_19_text = 'Albuquerque, NM'
    else
      reg_event.city_workshop_19_text = ''
    end 

    # 20 Baltimore, MD      Oct 13
    if reg_event.city_workshop_20
      reg_event.city_workshop_20_text = 'Baltimore, MD'
    else
      reg_event.city_workshop_20_text = ''
    end 

    # 21 Sacramento, CA     Oct 29
    if reg_event.city_workshop_21
      reg_event.city_workshop_21_text = 'Sacramento, CA'
    else
      reg_event.city_workshop_21_text = ''
    end 

    # 22 San Diego, CA      Nov 5
    if reg_event.city_workshop_22
      reg_event.city_workshop_22_text = 'San Diego, CA'
    else
      reg_event.city_workshop_22_text = ''
    end 
    
    @reg_event = reg_event
    
    if @reg_event.save
      
      session[:reg_event_saved] = true
      
      mail = RegEventMailer.welcome_email(@reg_event)
      mail.deliver
 
        # format.html { redirect_to(@user, notice: 'User was successfully created.') }
        # format.json { render json: @user, status: :created, location: @user }
      # else
        # format.html { render action: 'new' }
        # format.json { render json: @user.errors, status: :unprocessable_entity }
              
        # case account_type= params[:account_type]
        # when "School"
          # redirect_to(:controller => 'institutes', :action => 'new')
        # when "Teacher"
          # redirect_to(:controller => 'teachers', :action => 'new')
        # when "Student"
          # redirect_to(:controller => 'students', :action => 'new')
        # when "Publisher"
          # redirect_to(:controller => 'publishers', :action => 'new')
        # else
          # # alert error redirect
        # end
      
    else

      session[:reg_event_saved] = nil

    end
    
  end


  def show
  end
  
  
  private

    def reg_event_params
      params.require(:reg_event).permit(
          :name_first, 
          :name_last, 
          :name_title_sir,
          :name_title, 
          :type_affiliation, 
          :name_affiliation, 
          :address, 
          :city, 
          :state, 
          :zip, 
          :phone,
          :phone_mobile, 
          :email, 
          :email_cc_1, 
          :email_cc_2, 
          :city_workshop,
          :city_workshop_1,
          :city_workshop_2,
          :city_workshop_3,
          :city_workshop_4,
          :city_workshop_5,
          :city_workshop_6,
          :city_workshop_7,
          :city_workshop_8,
          :city_workshop_9,
          :city_workshop_10,
          :city_workshop_11,
          :city_workshop_12,
          :city_workshop_13,
          :city_workshop_14,
          :city_workshop_15,                              
          :city_workshop_16,                              
          :city_workshop_17,                              
          :city_workshop_18,                              
          :city_workshop_19,
          :city_workshop_20,
          :city_workshop_21,
          :city_workshop_22,                              
          :city_workshop_1_text,
          :city_workshop_2_text,
          :city_workshop_3_text,
          :city_workshop_4_text,
          :city_workshop_5_text,
          :city_workshop_6_text,
          :city_workshop_7_text,
          :city_workshop_8_text,
          :city_workshop_9_text,
          :city_workshop_10_text,
          :city_workshop_11_text,
          :city_workshop_12_text,
          :city_workshop_13_text,
          :city_workshop_14_text,          
          :city_workshop_15_text,       
          :city_workshop_16_text,       
          :city_workshop_17_text,       
          :city_workshop_18_text,       
          :city_workshop_19_text,
          :city_workshop_20_text,
          :city_workshop_21_text,
          :city_workshop_22_text
          # :city_workshop_1_session,
          # :city_workshop_2_session,
          # :city_workshop_3_session,
          # :city_workshop_4_session,
          # :city_workshop_5_session,
          # :city_workshop_6_session,
          # :city_workshop_7_session,
          # :city_workshop_8_session,
          # :city_workshop_9_session,
          # :city_workshop_10_session,
          # :city_workshop_11_session,
          # :city_workshop_12_session,
          # :city_workshop_13_session,
          # :city_workshop_14_session,
          # :city_workshop_1_session_text,
          # :city_workshop_2_session_text,
          # :city_workshop_3_session_text,
          # :city_workshop_4_session_text,
          # :city_workshop_5_session_text,
          # :city_workshop_6_session_text,
          # :city_workshop_7_session_text,
          # :city_workshop_8_session_text,
          # :city_workshop_9_session_text,
          # :city_workshop_10_session_text,
          # :city_workshop_11_session_text,
          # :city_workshop_12_session_text,
          # :city_workshop_13_session_text,
          # :city_workshop_14_session_text,
          # :created_at, 
          # :updated_at
          )
    end
  
end


