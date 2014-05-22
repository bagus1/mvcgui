class GridHtml
def instantiate
	@app_format = 'grid'
	@app_wrapper = '<table>'
	@app_wrapper_end = '</table>'
	@field_header_wrapper = '<th>'
	@field_header_wrapper_end =  '</th>'
	@record_wrapper = '<tr>'
	@record_wrapper_end = '</tr>'
	@field_wrapper = '<td>'
	@field_wrapper_end = '</td>'
	@header_row = true

end

end
