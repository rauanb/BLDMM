extends Control

var ori_centers = ["A", "E", "I", "M", "Q", "U"]
var ori_corners = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q",
		"R", "S", "T", "U", "V", "W", "X"]
var ori_edges = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q",
		"R", "S", "T", "U", "V", "W", "X"]
		
var centers
var corners
var edges

func _ready():
	centers = ori_centers
	corners = ori_corners
	edges = ori_edges
	# Converst to Green front White top
	move_z(3)
	print(centers)
	
	
	
func move_z(n):
	for i in n:
		centers = [centers[1], centers[5], centers[2], 
				centers[0], centers[4], centers[3]]
				
		corners  = [corners[7], corners[4], corners[5], corners[6],
				corners[23], corners[20], corners[21], corners[22],
				corners[11], corners[8], corners[9], corners[10],
				corners[3], corners[0], corners[1], corners[2],
				corners[17], corners[18], corners[19], corners[16],
				corners[15], corners[12], corners[13], corners[14]]
				
		edges  = [edges[7], edges[4], edges[5], edges[6],
				edges[23], edges[20], edges[21], edges[22],
				edges[11], edges[8], edges[9], edges[10],
				edges[3], edges[0], edges[1], edges[2],
				edges[17], edges[18], edges[19], edges[16],
				edges[15], edges[12], edges[13], edges[14]]
