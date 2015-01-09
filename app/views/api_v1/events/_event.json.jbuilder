json.id e.id

json.url v1_event_url(e)

json.name e.name
json.description e.description
json.created_at e.created_at
json.updated_at e.updated_at

json.logo_original_url asset_url(e.logo.url)
json.logo_medium_url asset_url(e.logo.url(:medium))
json.logo_thumb_url asset_url(e.logo.url(:thumb))

json.logo_file_name e.logo_file_name
json.logo_content_type e.logo_content_type
json.logo_file_size e.logo_file_size
json.logo_updated_at e.logo_updated_at