class OrganisationsController < ApplicationController
  before_action :set_organisation, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit,:update,:destroy]
 

  # GET /organisations or /organisations.json
  def index
    @organisations = Organisation.all

  end

  # GET /organisations/1 or /organisations/1.json
  def show
    
  end
def joined
end
  # GET /organisations/new
  def new
    #@organisation = Organisation.new
    @organisation = current_user.organisations.build
  end

  # GET /organisations/1/edit
  def edit
  session[:return_to] = request.referer
  end

  # POST /organisations or /organisations.json
  def create
    #@organisation = Organisation.new(organisation_params)
@organisation = current_user.organisations.build(organisation_params)
    respond_to do |format|
      if @organisation.save
        format.html { redirect_to @organisation, notice: "Organisation was successfully created." }
        format.json { render :show, status: :created, location: @organisation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @organisation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organisations/1 or /organisations/1.json
  def update
    respond_to do |format|
      if @organisation.update(organisation_params)
        format.html { redirect_to @organisation, notice: "Organisation was successfully updated." }
        format.json { render :show, status: :ok, location: @organisation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @organisation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organisations/1 or /organisations/1.json
  def destroy
    @organisation.destroy
    respond_to do |format|
      format.html { redirect_to organisations_url, notice: "Organisation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

def correct_user
#@organisation = current_user.organisations.find_by(id:params[:id])
#redirect_to organisations_path, notice: "Not authorised to edit this organisation" if @friend.nil?

end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organisation
      @organisation = Organisation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def organisation_params
      params.require(:organisation).permit(:name, :hourly_rate, :user_id)
    end
end
