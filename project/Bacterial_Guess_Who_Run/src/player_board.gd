extends Node2D

@onready var CardDatabase = preload("res://src/Data/Basic_bact_datasheet.json")
@onready var CardBase = preload("res://src/Data/card_base.tscn")
const Deck = preload("res://src/Data/Scripts/possible_cards.gd")
var PlayerDeck = []
var PlayerGuess
var BotDeck = []
var BotGuess
var DeckSize = Deck.CardList.size()
var GWBoardSize = 25
@onready var Grid = $"Card Slots/MargCont/CardGrid"
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
	#To check
	#for i in GWBoardSize:
		#print(str(PlayerDeck[i]))
	print(str(PlayerDeck))
	#add player GW card
	var playerCard = CardBase.instantiate()
	playerCard.CardName = PlayerGuess
	playerCard.scale *= (testCardSize)/(playerCard.get_size())
	$PlayerGWCard/MargCont/GWCard.add_child(playerCard)

#This function is to fill the grid with cards
func fill_grid(hand:Array):
	pass
	var cardArr = []
	var posArr = []
		
	#print(newCard.Gram)
	#newCard.CardInfo = CardDatabase.DATA[CardDatabase.E_coli]
		
	for i in GWBoardSize:
		cardArr.append(CardBase.instantiate())
		cardArr[i].CardName = hand[i]
		
		posArr.append(Panel.new())
		posArr[i].custom_minimum_size = testCardSize
		Grid.add_child(posArr[i])
		cardArr[i].scale *= (testCardSize)/(cardArr[i].get_size())
		posArr[i].add_child(cardArr[i])
		
	

		
		
# Calledfor every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

