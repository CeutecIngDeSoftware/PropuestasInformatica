json.array!(@requests_closures) do |requests_closure|
  json.extract! requests_closure, :id, :career_id, :final_date
  json.url requests_closure_url(requests_closure, format: :json)
end
