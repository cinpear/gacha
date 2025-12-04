extends Control

var points = 0
var points_per_click = 1
var auto_click_rate = 0

var upgrade1_cost = 10
var upgrade1_owned = 0
var upgrade2_cost = 50
var upgrade2_owned = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_points_display()
	update_upgrade_buttons()
	pass # Replace with function body.

func update_points_display():
	$PointsLabel.text = "Points: " + str(points)

func _on_button_pressed() -> void:
	points += points_per_click
	update_points_display()
	pass # Replace with function body.

func _on_timer_timeout() -> void:
	points += auto_click_rate
	update_points_display()

func _on_upgrade_1_pressed() -> void:
	if points >= upgrade1_cost:
		points -= upgrade1_cost
		upgrade1_owned += 1
		points_per_click += 1
		upgrade1_cost *= 2
		update_points_display()
		update_upgrade_buttons()

func _on_upgrade_2_pressed() -> void:
	if points >= upgrade2_cost:
		points -= upgrade2_cost
		upgrade2_owned += 1
		auto_click_rate += 1
		upgrade2_cost *= 2
		update_points_display()
		update_upgrade_buttons()

func update_upgrade_buttons():
	$VBoxContainer/Upgrade1.text = "Upgrade Click (+1/click) - Cost: " + str(upgrade1_cost)
	$VBoxContainer/Upgrade2.text = "Auto Click (+1/sec) - Cost: " + str(upgrade2_cost)
