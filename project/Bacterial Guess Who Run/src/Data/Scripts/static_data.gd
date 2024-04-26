extends Node

var itemData = {}
var dataFilePath = "res://src/Data/Basic_bact_datasheet.json"



# Called when the node enters the scene tree for the first time.
func _ready():
	itemData = load_json_file(dataFilePath)

#loading the file 
func load_json_file(filePath : String):
	if FileAccess.file_exists(filePath):
		
		var dataFile = FileAccess.open(filePath, FileAccess.READ)
		var parsedResult = JSON.parse_string(dataFile.get_as_text())
		
		if parsedResult is Dictionary:
			return parsedResult
		else:
			print("Error in parsing file, Dictionary does not Exist")
	else:
		print("Error in opening file, File Not Exist")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
