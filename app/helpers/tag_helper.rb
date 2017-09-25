module TagHelper
  def include_tag post, tags
    list_tag = Tag.all.map{|tag| tag.tag_name}
    tags.each do |tag|
      if list_tag.include? tag
        tag_ids = (Tag.where tag_name: tag).ids
        tag_ids.map {|id| post.post_tags.create tag_id: id}
      else
        post.tags.create tag_name: tag
      end
    end
  end
end
