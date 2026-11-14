extends Area2D
const speed=500
var possivals = [-100,-50,-10,-1,1,10,50,100]
var direction = possivals.pick_random()
var health = 100

@export var enemy_scene: PackedScene = preload("res://coin.tscn")

func _on_body_entered(body: Node2D) -> void:
	print("collision")
	$CollisionShape2D.disabled=false
