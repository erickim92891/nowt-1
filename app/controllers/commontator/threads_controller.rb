module Commontator
  class ThreadsController < Commontator::ApplicationController
    skip_before_filter :ensure_user, :only => :show

    before_filter :get_thread
    before_filter :set_commontable_url, :only => :show

    # GET /threads/1
    def show
      commontator_thread_show(@thread.commontable)

      respond_to do |format|
        format.html { redirect_to commontable_url }
        format.js
      end
    end
    
    # PUT /threads/1/close
    def close
      security_transgression_unless @thread.can_be_edited_by?(@user)

      @thread.errors.add(:base, t('commontator.thread.errors.already_closed')) \
        unless @thread.close(@user)

      respond_to do |format|
        format.html { redirect_to @thread }
        format.js { render :show }
      end
    end
    
    # PUT /threads/1/reopen
    def reopen
      security_transgression_unless @thread.can_be_edited_by?(@user)

      @thread.errors.add(:base, t('commontator.thread.errors.not_closed')) \
        unless @thread.reopen

      respond_to do |format|
        format.html { redirect_to @thread }
        format.js { render :show }
      end
    end
  end
end
