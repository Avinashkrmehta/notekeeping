class NoteskeepsController < ApplicationController
     before_action :find_note, only: [:show,:edit,:destroy,:update]
     before_action :authenticate_user! ,only:[:new,:edit]
    
    def index
        @notes = Noteskeep.all.order("created_at DESC")
    end
    
    def show
        @share = Share.select(:user_shared_to,:user_shared_by,:share_type).where(noteskeep_id: params[:id] )
        @user = User.all

    end
    
    def new
        #@note = Noteskeep.new
        @note = current_user.noteskeeps.build
        @user = User.all
    end
    
    
    def create
        # @note = Noteskeep.new(notes_params)
        @note = current_user.noteskeeps.build(notes_params)
        if save_status = @note.save
            
            if save_status 
                @note_id = @note.id
                puts @note_id
                puts "******************"
                @share = Share.new(:user_shared_to => params[:user_shared_to], :user_shared_by => params[:user_shared_by], :share_type => params[:share_type],:noteskeep_id => @note_id)
                    flag_save = @share.save
            end
            
            redirect_to noteskeeps_path
        else
            render 'new'
        end
            
    end
    
    def edit
         @user = User.all
    end
    
    def update
        puts "@note"
        puts @note
        if @note.update(notes_params)
            redirect_to noteskeep_path(@note)
        else
            render 'edit'
        end
    end
     
    
    def destroy
        @note.destroy
        redirect_to noteskeeps_path
    end
    
    def share_note

        @share = Share.new(:user_shared_to => params[:user_shared_to], :user_shared_by => params[:user_shared_by], :share_type => params[:share_type],:noteskeep_id => params[:notekeep_id])
        flag_save = @share.save
        
        redirect_to noteskeeps_path
            

    end
    
    private
    
    def find_note
        @note = Noteskeep.find(params[:id])
    end
    
    def notes_params
       params.require(:noteskeep).permit(:title,:description) 
    end
end
