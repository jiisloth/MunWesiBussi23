extends Control

var tightness = 0
var dj = 0
var volume = 0
var skin = 0
var driver = 0
var route = 0
var rounds = 0

var djs = ["MC Pökäle", "Pikku-Tane", "Molloman", "Vetäjä", "Ettu", "Joku", "MC Tane", "Soppanen"]
var drivers = ["Virtanen", "Korhonen", "Jarkkonen", "Törkynen", "Niskanen", "Kakkanen", "Perhonen", "Vihavainen"]
var routes = ["Kaupunkikierto", "Lähikylien pubit", "Pontikkametsä"]

func _ready():
    $Tightness/Tightness_text.text = "Jousitus: " + str(tightness)
    $DJ/DJ_text.text = "DJ: " + djs[dj]
    $Volume/Volume_text.text = "Volyymi: " + str(volume)
    $Skin/Skin_text.text = "Skini: " + str(skin)
    $Driver/Driver_text.text = "Kuski: " + drivers[driver]
    $Route/Route_text.text = "Reitti: " + routes[route]
    $Rounds/Rounds_text.text = "Kierrokset: " + str(rounds)

func _on_Tightness_value_changed(value):
    tightness = value
    $Tightness/Tightness_text.text = "Jousitus: " + str(value) 

func _on_DJ_value_changed(value):
    dj = value
    $DJ/DJ_text.text = "DJ: " + djs[dj]

func _on_Volume_value_changed(value):
    volume = value
    $Volume/Volume_text.text = "Volyymi: " + str(value)

func _on_Skin_value_changed(value):
    skin = value
    $Skin/Skin_text.text = "Skini: " + str(value)

func _on_Driver_value_changed(value):
    driver = value
    $Driver/Driver_text.text = "Kuski: " + drivers[value]

func _on_Route_value_changed(value):
    route = value
    $Route/Route_text.text = "Reitti: " + routes[route]

func _on_Rounds_value_changed(value):
    rounds = value
    $Rounds/Rounds_text.text = "Kierrokset: " + str(value)
