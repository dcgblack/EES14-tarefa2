module PublicationsHelper
  def belongs_to_user(publication)
    user_signed_in? && publication.user == current_user
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |authors|
      render(association.to_s + "_fields", f: authors)
    end
    
    link_to(name, '', class: "add_fields", data: { id: id, fields: fields.gsub("\n", "")})
  end
end
