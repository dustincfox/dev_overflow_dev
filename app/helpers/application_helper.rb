module ApplicationHelper

  def create_tag(tag)
    Tag.find_or_create_by_name(tag)
  end

end
