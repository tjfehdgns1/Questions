extends Node
class_name Main


func _init() -> void:
	# Create instance
	var car = Car.new() # High dependency
	var bike = Bike.new() # High dependency
	# Create instance from higher ref
	var car2 = Vehicle.new()
	
	var driver = Driver.new()
	
	car._set_vehicle("Tesla", "white")
	bike._set_vehicle("Super Cub", "black")
	
	driver._set_driver("Me", bike)
	driver.drive()
	
# Interface?
class Vehicle:
	# If private
	var model : String
	var color : String
	
	# Classic setter
	func _set_vehicle(model : String, color : String):
		self.model = model
		self.color = color
	
	func start_engine() -> void:
		print("%s engine Start" %model)
		
	func move_foward() -> void:
		print("%s moving forward" %model)
		
	func operate() -> void:
		start_engine()
		move_foward()

class Car extends Vehicle:
	# Specific
	func open_window() -> void:
		print("Car window open") # If model is private can't read from subclass? so should use getter?
	# Override
	func operate() -> void:
		super.operate()
		open_window()

class Bike extends Vehicle:
	# Specific
	func wheele() -> void:
		print("Bike wheeleing")
	# Override
	func operate() -> void:
		super.operate()
		wheele()


class Driver:
	# If private
	var driver_name : String
	var vehicle : Vehicle
	
	# Why this won't work
#	var driver_name : String : set = _set_driver
#	var vehicle : Vehicle : set = _set_driver
	
	func _set_driver(name : String, vehicle : Vehicle):
		self.driver_name = name
		self.vehicle = vehicle
		
	# Using Vehicle interface
	func drive() -> void:
		if !self.vehicle.model:
			printerr("model undefined")
			breakpoint
		vehicle.operate()
		
	
