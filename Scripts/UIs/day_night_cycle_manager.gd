extends Node

const  MINUTES_PER_DAY: int = 24 * 60
const MINUTES_PER_HOUR: int= 60
const GAME_MINUTE_DURATION: float = TAU / MINUTES_PER_DAY

var game_speed:float = 5.0


var inicial_day:int = 1
var inicial_hour:int = 00
var inicial_minute:int = 00

var time: float = 0.0
var current_minute: int = -1
var current_day: int = 0

signal game_time(time:float)
signal time_tick(day: int, hour: int, minute: int)
signal time_tick_day(day: int)

func _ready() -> void:
	set_inicial_time()
	
func _process(delta: float) -> void:
	time += delta * game_speed * GAME_MINUTE_DURATION
	game_time.emit(time)
	
	recalculate_time()


func set_inicial_time() ->void:
	var inicial_total_minutes = inicial_day * MINUTES_PER_DAY + (inicial_hour * MINUTES_PER_HOUR) + inicial_minute
	
	time = inicial_total_minutes * GAME_MINUTE_DURATION
	
func recalculate_time() ->void:
	var total_minutes:int = int(time/GAME_MINUTE_DURATION)
	var day: int =int(total_minutes/MINUTES_PER_DAY)
	var current_day_minutes: int = total_minutes % MINUTES_PER_DAY
	var hour: int= int(current_day_minutes/MINUTES_PER_HOUR)
	var minute: int = int(current_day_minutes % MINUTES_PER_HOUR)
	
	if current_minute != minute:
		current_minute = minute
		time_tick.emit(day, hour, minute)
		
	if current_day != day:
		current_day = day
		time_tick_day.emit(day)
