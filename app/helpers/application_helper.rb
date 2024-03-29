module ApplicationHelper
  def office_name
    if current_user.user_office == 1
      "International"
    elsif current_user.user_office == 2
      "Netherlands"
    elsif current_user.user_office == 3
      "Germany"
    elsif current_user.user_office == 4
      "Mediterranean"
    elsif current_user.user_office == 5
      "United Kingdom"
    else
      "Unidentified"
    end

  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end
end
