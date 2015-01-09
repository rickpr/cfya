class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  # GET /members
  # GET /members.json
  def index
    @members = Member.all
    @member = Member.new
  end

  # GET /members/1
  # GET /members/1.json
  def show
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new member_params
    if Member.find_by_name @member.name
      @member = Member.find_by_name @member.name
    puts "********"
    puts attendance_params.merge({member_id: @member.id, event_id: Event.find_by_day(Time.zone.today).id}) 
    puts "********"

      if @member.updated_at.today?
        @you_were_here = true
      else
        MemberEvent.create attendance_params.merge({member_id: @member.id, event_id: Event.find_by_day(Time.zone.today).id})
      end
      @growl_only = true
    else
      respond_to do |format|
        if @member.save
          MemberEvent.create attendance_params.merge({member_id: @member.id, event_id: Event.find_by_day(Time.zone.today).id})
          format.html { redirect_to @member, notice: 'Member was successfully created.' }
          format.json { render :show, status: :created, location: @member }
          format.js
        else
          format.html { render :new }
          format.json { render json: @member.errors, status: :unprocessable_entity }
          format.js
        end
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url, notice: 'Member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit :name, :category, :gender
    end

    def attendance_params
      params.require(:attendance).permit :dinner, :lesson, :activity
    end
end
