json.array!(@publications) do |publication|
  json.extract! publication, :id, :title, :subtitle, :edition, :local, :publishing_company, :year_of_publication, :description, :other, :category, :volume, :publication_number, :initial_final_page, :section
  json.url publication_url(publication, format: :json)
end
