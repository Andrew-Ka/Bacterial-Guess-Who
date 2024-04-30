extends Node

@onready var join = $Join
@onready var send = $Send
@onready var host = $Host
@onready var leave = $Leave
@onready var i_penter = $IPenter
@onready var input_message = $MarginContainer/Panel/InputMessage
@onready var message_hist = $MarginContainer/Panel/MessageHist

var IPAddress
var player


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass





func host_chat():
	var host = ENetMultiplayerPeer.new()
	host.create_server(2000)
	get_tree().set_multiplayer(SceneMultiplayer.new(),self.get_path())
	multiplayer.multiplayer_peer = host
	player = "P1"

func join_room():
	IPAddress = i_penter.text
	var host = ENetMultiplayerPeer.new()
	host.create_client(IPAddress, 2000)
	get_tree().set_multiplayer(SceneMultiplayer.new(),self.get_path())
	multiplayer.multiplayer_peer = host
	player = "P2"
	
	
	

#func send_message():
	#var message = $Chat/MarginContainer/Panel/InputMessage
	#var id = get_tree().get_network_unique_id()
	#rpc("recieve message", id, message)
	#$Chat/MarginContainer/Panel/InputMessage.text = ""


#func recieve_message(id, message):
	#$Chat/MarginContainer/Panel/MessageHist.text += str(id) + ": " + message + "\n"

func _on_join_button_up():
	join_room()
	join.visible = false
	host.hide()
	send.visible = true
	i_penter.hide()
	


func _on_host_button_up():
	host_chat()
	join.visible = false
	host.hide()
	send.visible = true
	i_penter.hide()



func _on_leave_button_up():
	pass # Replace with function body.


func _on_send_button_up():
	msg_rpc(player, input_message.text)
	input_message.text = ""


@rpc("any_peer", "call_local")
func msg_rpc(user, data):
	message_hist.text += str(user, ": ", data, "\n") 
	message_hist.scroll_vertical = INF
