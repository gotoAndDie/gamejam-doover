extends CenterContainer

var doFreeze = false

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("VBoxContainer/VBoxContainer/first").parse_bbcode(
	"[center]1st place: " + str(HighScoreTable.HighScores[0]) + "[/center]")
	get_node("VBoxContainer/VBoxContainer/second").parse_bbcode(
	"[center]2nd place: " + str(HighScoreTable.HighScores[1]) + "[/center]")
	get_node("VBoxContainer/VBoxContainer/third").parse_bbcode(
	"[center]3rd place: " + str(HighScoreTable.HighScores[2]) + "[/center]")
	get_node("VBoxContainer/VBoxContainer/fourth").parse_bbcode(
	"[center]4th place: " + str(HighScoreTable.HighScores[3]) + "[/center]")
	get_node("VBoxContainer/VBoxContainer/fifth").parse_bbcode(
	"[center]5th place: " + str(HighScoreTable.HighScores[4]) + "[/center]")

func freeze():
	doFreeze = true
	# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
