extends Node

var HighScores = [0,0,0,0,0]
var currentScore = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func insert():
	var newHighScores = []
	for i in HighScores:
		if currentScore > i:
			newHighScores.append(currentScore)
			currentScore = i
		else:
			newHighScores.append(i)
	HighScores = newHighScores
		
