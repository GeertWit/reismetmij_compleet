class Inboxes::SpeakersController < Inboxes::BaseController
  load_and_authorize_resource :discussion
  load_resource :speaker, :through => :discussion, :shallow => true

  def create
    raise ActiveRecord::RecordNotFound unless params[:speaker] && params[:speaker][:user_id]
    @user = User.find(params[:speaker][:user_id])
    flash[:notice] = t("speakers.added") if @discussion.add_speaker(@user)
    redirect_to discussion_url(@discussion)
  end

  def destroy
    @speaker = Speaker.find(params[:id])
    @speaker.destroy
    flash[:notice] = @speaker.user == current_user ? t("discussions.leaved") : t("speakers.removed")
    redirect_to @discussion.speakers.any? && @discussion.can_participate?(current_user) ? discussion_url(@discussion) : discussions_url
  end
end