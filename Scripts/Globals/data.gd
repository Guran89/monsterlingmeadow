extends Node

const DATA_PATH = "res://Data/"

var times = loadCategory("Times")
var food = loadCategory("Food")
var arms = loadCategory("Arms")
var eyes = loadCategory("Eyes")
var heads = loadCategory("Heads")
var legs = loadCategory("Legs")
var mouths = loadCategory("Mouths")
var torsos = loadCategory("Torsos")
var icons = loadCategory("Icons")

func loadCategory(category):
	return loadDirectory(DATA_PATH + category + "/", category)

func loadDirectory(path, directory = ""):
	var data = {}
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()

		while true:
			var file = dir.get_next()
			if file == "":
				break
			if file.begins_with("."):
				continue

			if '.tres.remap' in file:
				file = file.trim_suffix('.remap')
			var resourcePath = path + file
			var fileName = file.get_slice(".", 0)
			if dir.current_is_dir():
				var subDirectory = loadDirectory(resourcePath + "/", fileName)
				data.merge(subDirectory) # not recursive
				continue

			print("loading ", resourcePath)
			var resource = load(resourcePath)
			fileName = fileName.to_upper()
			data[fileName] = resource

		dir.list_dir_end()

	return data

func merge(writeDirectory, readDirectory):
	for i in readDirectory:
		var value = readDirectory[i]
		if value is Dictionary:
			merge(readDirectory, value)
		writeDirectory[i] = readDirectory[i]
