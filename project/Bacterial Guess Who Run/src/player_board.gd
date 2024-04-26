extends Node2D

#@onready var CardDatabase = preload("res://src/Data/Basic_bact_datasheet.json")
@onready var CardBase = preload("res://src/Data/card_base.tscn")
#temporary
#@onready var GridPosVar = preload("res://Data/alpha/grid_pos.tscn")
const Deck = preload("res://src/Data/Scripts/possible_cards.gd")
var PlayerDeck = []
var PlayerGuess
var BotDeck = []
var BotGuess
var DeckSize = Deck.CardList.size()
var GWBoardSize = 25
@onready var Grid = $"Card Slots/MargCont/CardGrid"
#var BoardSize = $"Card Slots/MarginContainer".size
var testCardSize = Vector2(75, 109)

# Called when the node enters the scene tree for the first time.
func _ready():	
	var randInt
	var randIntHolder = []
	
	while (PlayerDeck.size() < GWBoardSize):
		randInt = randi() % DeckSize
		if (!(randIntHolder.has(randInt))):
			randIntHolder.append(randInt)
			PlayerDeck.append(Deck.CardList[randInt])
			BotDeck.append(Deck.CardList[(randInt+5) % DeckSize])
	
	
	randInt = randInt % GWBoardSize
	PlayerGuess = BotDeck[randInt]
	BotGuess = PlayerDeck[(randInt+2) % GWBoardSize]
	
	fill_grid(PlayerDeck)
	
	#$"Card Slots/MarginContainer/GridContainer".add_child()
	
	#To check
	#for i in GWBoardSize:
		#print(str(PlayerDeck[i]))
	print(str(PlayerDeck))

#This function is to fill the grid with cards
func fill_grid(hand:Array):
	pass
	var cardArr = []
	var posArr = []
	#var newCard = CardBase.instantiate()
	#newCard.scale *= (testCardSize)/(newCard.get_size())
	#var panel1 = Panel.new()
	#posArr.append(panel1)
	#var panel2 = Panel.new()
	#posArr.append(panel2)
	#posArr[0].size = testCardSize
	#Grid.add_child(posArr[0])
	#posArr[0].add_child(newCard)
	
	#print(newCard.Gram)
	#newCard.CardInfo = CardDatabase.DATA[CardDatabase.E_coli]
	
	#make the positions
	#for i in GWBoardSize:
		##posArr.append(GridPosVar.instantiate())
		##Grid.add_child(posArr[i])
		##print(posArr[i].position)
		##print(posArr[i].position.y)
		#posArr.append(Panel)
		
	
	
	
	for i in GWBoardSize:
		cardArr.append(CardBase.instantiate())
		cardArr[i].CardName = hand[i]
		#
		##print(cardArr[i].CardName)
		##print(cardArr[i].scale)
		##print(cardArr[i].size)
		#cardArr[i].scale *= (testCardSize)/(cardArr[i].get_size())
		#
		##$"Card Slots".add_child(cardArr[i], false, 0)
		##Grid.add_child(cardArr[i], false, 0)
		##cardArr[i].position = posArr[i].global_position
		#posArr[i].add_child(cardArr[i])
		posArr.append(Panel.new())
		posArr[i].custom_minimum_size = testCardSize
		Grid.add_child(posArr[i])
		cardArr[i].scale *= (testCardSize)/(cardArr[i].get_size())
		posArr[i].add_child(cardArr[i])
		
		
		
		
# Calledfor every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

