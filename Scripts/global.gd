extends Node

var is_dragging=false


#Settings button states
var full_screen_control_pressed = false
var audio_control_slider = 1
var sfx_control_slider = 1


#List of all completed recipes
const completed_recipes: Array=[ "Blueberry Milkshake","Strawberry Milkshake", 
"Apple Milkshake","Bloodshot eye Milkshake","Basic Milkshake",
"Biscuit Milkshake","Carrot Cake","Bloody Cake","Crystal Cake",
"Fruit Cake","Rainbow Cake","Basic Cake"]


#Keep track of if a customer is waiting for food or not
var line_spot_1_occupied = false

#Charatcer order
var order: Array=[]
