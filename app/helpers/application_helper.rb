module ApplicationHelper
  def user_area(&block)
    content_tag(:div, :class => "leftmenu admin", &block) if user_signed_in? && !current_user.is_admin?
  end
  
  def admin_area(&block)
    content_tag(:div, :class => "leftmenu admin", &block) if user_signed_in? && current_user.is_admin?
  end
  
  def sponsor_area(&block)
    content_tag(:div, :class => "leftmenu sponsors", &block) if user_signed_in? && current_user.is_a_sponsor? && current_user.sponsor.is_verified
  end
  
  def trunkate(content)
    wordcount = 10
    content.split[0..(wordcount-1)].join(" ") + (content.split.size > wordcount ? "..." : "")
  end
end
