module PublicationsHelper
  def belongs_to_user(publication)
    user_signed_in? && publication.user == current_user
  end
end
