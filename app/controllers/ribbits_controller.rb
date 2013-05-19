class RibbitsController < ApplicationController
    def index
        @ribbits = Ribbit.all include: :user
        @ribbit = Ribbit.new
    end

    def create
        @ribbit = Ribbit.new(params[:ribbit])
        @ribbit.user_id = current_user.id

        if @ribbit.save
            redirect_to current_user 
        else
            flash[:error] = "Problem!";
            redirect_to current_user
        end
    end

    def destroy
      @ribbit = Rbbit.find(params[:id])
      @ribbit.destroy

      respond_to do |format|
        format.html { redirect_to posts_url }
        format.json { head :no_content }
      end
    end

    def show
      @ribbit = Ribbit.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @request }
        format.json{
          render :json => @request.to_json
        }
      end
    end

  end
