class AdminController < ApplicationController
  # Bringing in Pagy for pagination
  include Pagy::Backend
    # Only allow staff to access the admin dashboard
  before_action :authenticate_staff!  # GET /admin
  #
  # Shows the admin dashboard, containing all leads and newsletters.
  def index
    @q = Lead.ransack(params[:q])
    @pagy_leads, @leads = pagy(@q.result(distinct: true), limit: 20, params: { pagy_leads: true })
    @pagy_newsletters, @newsletters = pagy(Newsletter.order(updated_at: :desc), limit: 20, params: { pagy_newsletters: true })
  end

  # POST /admin/update_lead/:id
  #
  # Update note for lead through admin dashboard
  def update_lead
    puts "LEAD PARAMS: #{lead_params}"
    #! TODO: Write unit test for this action
    @lead = Lead.find(params[:id])
    respond_to do |format|
      if @lead.update(lead_params)
        redirect_to admin_path, flash: { admin_alert: "Lead was successfully updated." }
      else
        redirect_to admin_path
      end
    end
  end

  # DELETE /admin/destroy_lead/:id
  #
  # Delete a lead through the admin dashboard
  def destroy_lead
    #! TODO: Write unit test for this action
    @lead = Lead.find(params[:id])

    respond_to do |format|
      if @lead.destroy!
        redirect_to admin_path, flash: { admin_alert: "Lead was successfully destroyed." }
      else
        redirect_to admin_path
      end
    end
  end

  # DELETE /admin/destroy_newsletter/:id
  #
  # Delete a newsletter through the admin dashboard
  def destroy_newsletter
    # TODO: Write unit test for this action
    @newsletter = Newsletter.find(params[:id])
    @newsletter.destroy!

    redirect_to admin_path, flash: { admin_alert: "Newsletter was successfully destroyed." }
  end

  private

  # Strong parameters for lead update action
  #
  # Whitelist the +note+ attribute of the +lead+ model.
  def lead_params
    params.require(:lead).permit(:note)
  end

  # Before filter to ensure only staff (admins and advisors) can access the
  # advisor dashboard.
  #
  # If the user is not signed in or the user is not an admin or advisor, redirect
  # to the root path and alert the user that they are not authorized to access
  # the page.
  def authenticate_staff!
    if !admin_signed_in? || !["admin", "advisor"].include?(current_admin.role)
      flash[:alert] = "You are not authorized to access this page."
      redirect_to root_path
    end
  end
end
