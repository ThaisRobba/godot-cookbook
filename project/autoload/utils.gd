extends Node


func array_has_all(source: Array, all: Array):
	for entry in all:
		if !source.has(entry):
			return false
	return true


func array_has_any(source: Array, any: Array):
	for entry in any:
		if source.has(entry):
			return true
	return false


func array_join(source: Array, separator: String = "", pad_left: String = ""):
	var output := ""
	if source.size() > 0:
		output += pad_left
	for s in source:
		output += str(s) + separator
	output = output.left(output.length() - separator.length())
	return output


func get_filelist(scan_dir: String, ext: String = "") -> Array:
	var my_files : Array = []
	var dir := Directory.new()
	if dir.open(scan_dir) != OK:
		printerr("Warning: could not open directory: ", scan_dir)
		return []

	if dir.list_dir_begin(true, true) != OK:
		printerr("Warning: could not list contents of: ", scan_dir)
		return []

	var file_name := dir.get_next()
	while file_name != "":
		if dir.current_is_dir():
			my_files += get_filelist(dir.get_current_dir() + "/" + file_name, ext)
		else:
			if ext == "" or file_name.get_extension() == ext:
				my_files.append(dir.get_current_dir() + "/" + file_name)

		file_name = dir.get_next()

	return my_files


func read_file(file: String) -> String:
	var f = File.new()
	f.open(file, File.READ)
	var contents = f.get_as_text()
	f.close()
	return contents


func get_file_name(filepath: String) -> String:
	var start = filepath.find_last("/") + 1
	var end = filepath.find_last(".") - start
	return filepath.substr(start, end)


func get_formatted_file_name(filepath: String) -> String:
	return get_file_name(filepath).replace("_", " ").capitalize()


func get_description(filepath: String) -> String:
	var file = filepath.replace("tscn", "gd")
	var f = File.new()
	f.open(file, File.READ)
	f.get_line() # We discard the first line which contains only three double quotes
	var result = f.get_line()
	f.close()
	return result
