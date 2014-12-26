module UsersHelper
  # プロフィール画像を表示
  def profile_image_for(user, size = '52')
    if !user.image
      return image_tag "", size: size
    # SNSログインの場合
    elsif user.image.slice(0, 4) == "http"
      return image_tag user.image, size: size
    # Eメールログインの場合
    else user.image
      return image_tag "/docs/#{user.image}", size: size
    end
  end

  def current_user?(user)
    current_user == user
  end

end