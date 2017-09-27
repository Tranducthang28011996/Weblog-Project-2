module TagHelper
  def include_tag post, tags
    list_tag = Tag.all.map{|tag| tag.tag_name}
    tags.uniq.each do |tag|
      if list_tag.include? tag
        tag_ids = (Tag.where tag_name: tag).ids
        tag_ids.map {|id| post.post_tags.create tag_id: id}
      else
        post.tags.create tag_name: tag
      end
    end
  end

  def update_tag post, tag_ids, tags
    if params[:tag_ids].present?

      tag_ids = tag_ids.map {|id| id.to_i}
      current_tag_ids = post.post_tags.map{|tag| tag.tag_id}
      tag_ids.select{|x| !current_tag_ids.include? x}
      destroy_tags = current_tag_ids - tag_ids
      post.post_tags.where("tag_id IN (?)", destroy_tags).destroy_all
    else
      post.post_tags.destroy_all
    end

    if params[:tags].present?
      current_tag_names= post.tags.map{|tag| tag.tag_name}
      tags -= current_tag_names
      list_tag = Tag.all.map{|tag| tag.tag_name}
      tags.uniq.each do |tag|
        if list_tag.include? tag
          tag_ids = (Tag.where tag_name: tag).ids
          tag_ids.map {|id| post.post_tags.create tag_id: id}
        else
          post.tags.create tag_name: tag
        end
      end
    end
  end
end
