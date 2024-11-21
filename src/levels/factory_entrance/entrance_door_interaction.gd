extends Node


func interact():
	var LoadingManager := get_tree().root.get_node("/root/LoadingManager")
	LoadingManager.load_scene("res://src/levels/inside_factory/inside_factory.tscn")
	pass
