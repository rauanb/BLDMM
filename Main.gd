extends Control

var ori_centers = ["A", "E", "I", "M", "Q", "U"]
var ori_corners = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q",
		"R", "S", "T", "U", "V", "W", "X"]
var ori_edges = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q",
		"R", "S", "T", "U", "V", "W", "X"]
		
var colors = {"A":Color(1, 1, 0, 1),"B":Color(1, 1, 0, 1),
	"C":Color(1, 1, 0, 1),"D":Color(1, 1, 0, 1),
	
	"E":Color(0, 0, 1, 1),"F":Color(0, 0, 1, 1),
	"G":Color(0, 0, 1, 1),"H":Color(0, 0, 1, 1),
	
	"I":Color(1, 0, 0, 1),"J":Color(1, 0, 0, 1),
	"K":Color(1, 0, 0, 1),"L":Color(1, 0, 0, 1),
	
	"M":Color(0, 1, 0, 1),"N":Color(0, 1, 0, 1),
	"O":Color(0, 1, 0, 1),"P":Color(0, 1, 0, 1),
	
	"Q":Color(1, 0.667, 0, 1),"R":Color(1, 0.667, 0, 1),
	"S":Color(1, 0.667, 0, 1),"T":Color(1, 0.667, 0, 1),
	
	"U":Color(1, 1, 1, 1),"V":Color(1, 1, 1, 1),
	"W":Color(1, 1, 1, 1),"X":Color(1, 1, 1, 1),}


var centers
var corners
var edges

func _ready():
	OS.set_current_screen(0)
	centers = ori_centers
	corners = ori_corners
	edges = ori_edges
	$scrambleText.set_placeholder("Scramble") 
	
	move_z(2)
	move_y(3)
	update_img()
	
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	if Input.is_action_just_pressed("ui_accept"):
		read_scramble()
		update_img()
		
func read_scramble():
	var scramble = $scrambleText.get_text()
	$scrambleText.text = ""
	print(scramble)
	
func make_moves():
	pass
	
func update_img():
#	Front
	$A10.set_modulate(colors[corners[8]])
	$A11.set_modulate(colors[edges[8]])
	$A12.set_modulate(colors[corners[9]])
	$A13.set_modulate(colors[edges[11]])
	$A14.set_modulate(colors[centers[2]])
	$A15.set_modulate(colors[edges[9]])
	$A16.set_modulate(colors[corners[11]])
	$A17.set_modulate(colors[edges[10]])
	$A18.set_modulate(colors[corners[10]])
	
#	Up
	$A1.set_modulate(colors[corners[0]])
	$A2.set_modulate(colors[edges[0]])
	$A3.set_modulate(colors[corners[1]])
	$A4.set_modulate(colors[edges[3]])
	$A5.set_modulate(colors[centers[0]])
	$A6.set_modulate(colors[edges[1]])
	$A7.set_modulate(colors[corners[3]])
	$A8.set_modulate(colors[edges[2]])
	$A9.set_modulate(colors[corners[2]])
	
#	Left
	$A19.set_modulate(colors[corners[4]])
	$A20.set_modulate(colors[edges[4]])
	$A21.set_modulate(colors[corners[5]])
	$A22.set_modulate(colors[edges[7]])
	$A23.set_modulate(colors[centers[1]])
	$A24.set_modulate(colors[edges[5]])
	$A25.set_modulate(colors[corners[7]])
	$A26.set_modulate(colors[edges[6]])
	$A27.set_modulate(colors[corners[6]])
	
#	Down
	$A28.set_modulate(colors[corners[20]])
	$A29.set_modulate(colors[edges[20]])
	$A30.set_modulate(colors[corners[21]])
	$A31.set_modulate(colors[edges[23]])
	$A32.set_modulate(colors[centers[5]])
	$A33.set_modulate(colors[edges[21]])
	$A34.set_modulate(colors[corners[23]])
	$A35.set_modulate(colors[edges[22]])
	$A36.set_modulate(colors[corners[22]])
	
#	Right
	$A37.set_modulate(colors[corners[12]])
	$A38.set_modulate(colors[edges[12]])
	$A39.set_modulate(colors[corners[13]])
	$A40.set_modulate(colors[edges[15]])
	$A41.set_modulate(colors[centers[3]])
	$A42.set_modulate(colors[edges[13]])
	$A43.set_modulate(colors[corners[15]])
	$A44.set_modulate(colors[edges[14]])
	$A45.set_modulate(colors[corners[14]])
	
#	Back
	$A46.set_modulate(colors[corners[16]])
	$A47.set_modulate(colors[edges[16]])
	$A48.set_modulate(colors[corners[17]])
	$A49.set_modulate(colors[edges[19]])
	$A50.set_modulate(colors[centers[4]])
	$A51.set_modulate(colors[edges[17]])
	$A52.set_modulate(colors[corners[19]])
	$A53.set_modulate(colors[edges[18]])
	$A54.set_modulate(colors[corners[18]])

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

func move_x(n):
	for i in n:
		centers = [centers[2], centers[1], centers[5], 
				centers[3], centers[0], centers[4]]
				
		corners  = [corners[8], corners[9], corners[10], corners[11],
				corners[5], corners[6], corners[7], corners[4],
				corners[20], corners[21], corners[22], corners[23],
				corners[15], corners[12], corners[13], corners[14],
				corners[0], corners[1], corners[2], corners[3],
				corners[18], corners[19], corners[16], corners[17]]
				
		edges  = [edges[8], edges[9], edges[10], edges[11],
				edges[5], edges[6], edges[7], edges[4],
				edges[20], edges[21], edges[22], edges[23],
				edges[15], edges[12], edges[13], edges[14],
				edges[2], edges[3], edges[0], edges[1],
				edges[18], edges[19], edges[16], edges[17]]

func move_y(n):
	for i in n:
		centers = [centers[0], centers[2], centers[3], 
				centers[4], centers[1], centers[5]]
				
		corners  = [corners[3], corners[0], corners[1], corners[2],
				corners[8], corners[9], corners[10], corners[11],
				corners[12], corners[13], corners[14], corners[15],
				corners[16], corners[17], corners[18], corners[19],
				corners[4], corners[5], corners[6], corners[7],
				corners[21], corners[22], corners[23], corners[20]]
				
		edges  = [edges[3], edges[0], edges[1], edges[2],
				edges[8], edges[9], edges[10], edges[11],
				edges[12], edges[13], edges[14], edges[15],
				edges[16], edges[17], edges[18], edges[19],
				edges[4], edges[5], edges[6], edges[7],
				edges[21], edges[22], edges[23], edges[20]]

func move_r(n):
	for i in n:
		corners  = [corners[0], corners[9], corners[10], corners[3],
				corners[4], corners[5], corners[6], corners[7],
				corners[8], corners[21], corners[22], corners[11],
				corners[15], corners[12], corners[13], corners[14],
				corners[2], corners[17], corners[18], corners[1],
				corners[20], corners[19], corners[16], corners[23]]
				
		edges  = [edges[0], edges[9], edges[2], edges[3],
				edges[4], edges[5], edges[6], edges[7],
				edges[8], edges[21], edges[10], edges[11],
				edges[15], edges[12], edges[13], edges[14],
				edges[16], edges[17], edges[18], edges[1],
				edges[20], edges[19], edges[22], edges[23]]

func move_u(n):
	for i in n:
		corners  = [corners[3], corners[0], corners[1], corners[2],
					corners[8], corners[9], corners[6], corners[7],
					corners[12], corners[13], corners[10], corners[11],
					corners[16], corners[17], corners[14], corners[15],
					corners[4], corners[5], corners[18], corners[19],
					corners[20], corners[21], corners[22], corners[23]]
					
		edges  = [edges[3], edges[0], edges[1], edges[2],
					edges[8], edges[5], edges[6], edges[7],
					edges[12], edges[9], edges[10], edges[11],
					edges[16], edges[13], edges[14], edges[15],
					edges[4], edges[17], edges[18], edges[19],
					edges[20], edges[21], edges[22], edges[23]]

func move_f(n):
	for i in n:
		corners  = [corners[0], corners[1], corners[5], corners[6],
					corners[4], corners[20], corners[21], corners[7],
					corners[11], corners[8], corners[9], corners[10],
					corners[3], corners[13], corners[14], corners[2],
					corners[16], corners[17], corners[18], corners[19],
					corners[15], corners[12], corners[22], corners[23]]
					
		edges  = [edges[0], edges[1], edges[5], edges[3],
					edges[4], edges[20], edges[6], edges[7],
					edges[11], edges[8], edges[9], edges[10],
					edges[12], edges[13], edges[14], edges[2],
					edges[16], edges[17], edges[18], edges[19],
					edges[15], edges[21], edges[22], edges[23]]

func move_l(n):
	for i in n:
		corners  = [corners[18], corners[1], corners[2], corners[17],
					corners[7], corners[4], corners[5], corners[6],
					corners[0], corners[9], corners[10], corners[3],
					corners[12], corners[13], corners[14], corners[15],
					corners[16], corners[23], corners[20], corners[19],
					corners[8], corners[21], corners[22], corners[11]]
					
		edges  = [edges[0], edges[1], edges[2], edges[17],
					edges[7], edges[4], edges[5], edges[6],
					edges[8], edges[9], edges[10], edges[3],
					edges[12], edges[13], edges[14], edges[15],
					edges[16], edges[23], edges[18], edges[19],
					edges[20], edges[21], edges[22], edges[11]]
	
func move_d(n):
	for i in n:
		corners  = [corners[0], corners[1], corners[2], corners[3],
					corners[4], corners[5], corners[18], corners[19],
					corners[8], corners[9], corners[6], corners[7],
					corners[12], corners[13], corners[10], corners[11],
					corners[16], corners[17], corners[14], corners[15],
					corners[23], corners[20], corners[21], corners[22]]
					
		edges  = [edges[0], edges[1], edges[2], edges[3],
					edges[4], edges[5], edges[18], edges[7],
					edges[8], edges[9], edges[6], edges[11],
					edges[12], edges[13], edges[10], edges[15],
					edges[16], edges[17], edges[14], edges[19],
					edges[23], edges[20], edges[21], edges[22]]
	
func move_b(n):
	for i in n:
		corners  = [corners[13], corners[14], corners[2], corners[3],
					corners[1], corners[5], corners[6], corners[0],
					corners[8], corners[9], corners[10], corners[11],
					corners[12], corners[22], corners[23], corners[15],
					corners[19], corners[16], corners[17], corners[18],
					corners[20], corners[21], corners[7], corners[4]]
					
		edges  = [edges[13], edges[1], edges[2], edges[3],
					edges[4], edges[5], edges[6], edges[0],
					edges[8], edges[9], edges[10], edges[11],
					edges[12], edges[22], edges[14], edges[15],
					edges[19], edges[16], edges[17], edges[18],
					edges[20], edges[21], edges[7], edges[23]]

func move_m(n):
	for i in n:
		move_x(3)
		move_r(1)
		move_l(3)
				
func move_s(n):
	for i in n:
		move_z(1)
		move_f(3)
		move_b(1)
				
func move_e(n):
	for i in n:
		move_y(3)
		move_u(1)
		move_d(3)
