extends Node
@onready var score_lable: Label = $ScoreLable

var score:float = 0;

func add_point():
	score += 1
	score_lable.text = "Still Alive ..... ohh you " + str(score) + " coins"
