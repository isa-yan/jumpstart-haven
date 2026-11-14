extends CharacterBody2D

signal coin_collected

const speed = 500
var possivals = [-100, -50, -10, -1, 1, 10, 50, 100]
var direction = possivals.pick_random()
var collisions := 0

@onready var label: Label = get_tree().get_first_node_in_group("counter_label")

func _ready():
	if label:
		label.text = "Collisions: 0"

func _physics_process(delta):
	velocity.x += direction
	velocity.x = clamp(velocity.x, -300, 300)

	if not is_on_floor():
		velocity.y += speed * delta * 2

	if is_on_floor():
		velocity.y -= speed * delta * 100
		direction = possivals.pick_random()

	if is_on_wall():
		direction = possivals.pick_random()

	move_and_slide()


func add_collision():
	collisions += 1
	print("collision ", collisions)
	if label:
		label.text = "Collisions: " + str(collisions)


func _on_area_2d_body_entered(body: Node2D) -> void:
	add_collision()
	coin_collected.emit()


# Your player's izzyarea calls this when it touches the coin
func damage(amount):
	add_collision()
