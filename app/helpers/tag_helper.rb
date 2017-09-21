module TagHelper
  def include_tag post, tags
    tags.each do |tag|
      post.tags.create tag_name: tag
    end
  end
end
