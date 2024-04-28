extends MarginContainer

@onready var CardDatabase = preload("res://src/Data/Basic_bact_datasheet.json")
var CardName = "Anaplasma phagocytophilum"
#var CardInfo = StaticData.itemData["Acinetobacter baumannii"]["Gram"]
#@onready var CardInfo = CardDatabase.DATA[CardName]
#@onready var CardInfo = CardDatabase.DATA[CardDatabase.E_coli]

@onready var CarImg = str("res://src/Data/Images/Ex Transp Img Gemini.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	#print("Win")
	var CardSize = size
	#9:29 in vid 
	$Card_Sprite2D.texture = load(CarImg)
	$Card_Sprite2D.scale *= CardSize/$Card_Sprite2D.texture.get_size()
	
	var Gram = StaticData.itemData[CardName]["Gram"]
	#Solved by Arvind Mova, the absolute madlad
	#print(Gram)
	if (Gram == "Gram-positive"):
		#Deep purple
		$CardBackgroundColor.color = Color(0.580392, 0, 0.827451, 1)
	elif (Gram == "Gram-negative"): #elif is else if
		#Salmon Pink
		$CardBackgroundColor.color = Color(0.980392, 0.501961, 0.447059, 1)
	else:
		#Blue
		$CardBackgroundColor.color = Color(0.678431, 0.847059, 0.901961, 1)
	
	
	$VBoxContainer/BactName.text = CardName
	#$VBoxContainer/Description.text = "Gram: " + Gram + "\nLocation of Infection: " + LocInf + "\nMetabolism: " + Metabolism
	
	#The description is gonna have the Morphology, Metabolism, and Clinical Features.
	var Morphology = StaticData.itemData[CardName]["Morphology"]
	var Metabolism = StaticData.itemData[CardName]["Metabolism (anaerobic, facultative, ...)"]
	var ClinFeat = StaticData.itemData[CardName]["Clinical Features"]
	#print(Morphology)
	#print(Metabolism)
	#print(ClinFeat)
	$VBoxContainer/Description.text = Morphology + "\n" + Metabolism + "\nClinical Features: " + ClinFeat
	 
	
	
	
	
	

#func _input(event):
	#$CardBack.scale = size/$CardBack.texture.get_size()
	#$CardBack.visible = !$CardBack.visible
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_flip_button_pressed():
	$CardBack.scale = size/$CardBack.texture.get_size()
	$CardBack.visible = !$CardBack.visible
	$CardBackgroundColor.visible = !$CardBackgroundColor.visible
	$Card_Sprite2D.visible = !$Card_Sprite2D.visible
	$VBoxContainer.visible = !$VBoxContainer.visible


func _on_flip_button_mouse_entered():
	scale *= 2.5
	z_index += 10


func _on_flip_button_mouse_exited():
	scale /= 2.5
	z_index -= 10
