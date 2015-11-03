json.array!(@format_forms) do |format_form|
  json.extract! format_form, :id, :title, :description, :public
  json.url format_form_url(format_form, format: :json)
end
