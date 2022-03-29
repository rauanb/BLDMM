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
		get_orientation()
		
func get_orientation():
	var count = 0
	while centers[0] != "A":
		move_z(1)
		count += 1
		
		if count == 4:
			count = 4
			move_y(1) 
	while centers[1] != "E":
		move_y(1)
	
		
func read_scramble():
	var scrambleText = $scrambleText.get_text()
	$scrambleText.text = ""
	var moves = scrambleText.split(" ")
	for i in moves.size():
		if moves[i] == "D":
			move_d(1)
		elif moves[i] == "d" or moves[i] == "Dw":
			move_d(1)
			move_e(1)
		elif moves[i] == "D2":
			move_d(2)
		elif moves[i] == "d2" or moves[i] == "Dw2":
			move_d(2)
			move_e(2)
		elif moves[i] == "D'":
			move_d(3)
		elif moves[i] == "d'" or moves[i] == "Dw'":
			move_d(3)
			move_e(3)
		elif moves[i] == "R":
			move_r(1)
		elif moves[i] == "r" or moves[i] == "Rw":
			move_r(1)
			move_m(3)
		elif moves[i] == "R2":
			move_r(2)
		elif moves[i] == "r2" or moves[i] == "Rw2":
			move_r(2)
			move_m(2)
		elif moves[i] == "R'":
			move_r(3)
		elif moves[i] == "r'" or moves[i] == "Rw'":
			move_r(3)
			move_m(1)
		elif moves[i] == "U":
			move_u(1)
		elif moves[i] == "u" or moves[i] == "Uw":
			move_u(1)
			move_e(3)
		elif moves[i] == "U2":
			move_u(2)
		elif moves[i] == "u2" or moves[i] == "Uw2":
			move_u(2)
			move_e(2)
		elif moves[i] == "U'":
			move_u(3)
		elif moves[i] == "u'" or moves[i] == "Uw'":
			move_u(3)
			move_e(1)
		elif moves[i] == "F":
			move_f(1)
		elif moves[i] == "f" or moves[i] == "Fw":
			move_f(1)
			move_s(1)
		elif moves[i] == "F2":
			move_f(2)
		elif moves[i] == "f2" or moves[i] == "Fw2":
			move_f(2)
			move_s(2)
		elif moves[i] == "F'":
			move_f(3)
		elif moves[i] == "f'" or moves[i] == "Fw'":
			move_f(3)
			move_s(3)
		elif moves[i] == "B":
			move_b(1)
		elif moves[i] == "b" or moves[i] == "Bw":
			move_b(1)
			move_s(3)
		elif moves[i] == "B2":
			move_b(2)
		elif moves[i] == "b2" or moves[i] == "Bw2":
			move_b(2)
			move_s(2)
		elif moves[i] == "B'":
			move_b(3)
		elif moves[i] == "b'" or moves[i] == "Bw'":
			move_b(3)
			move_s(1)
		elif moves[i] == "L":
			move_l(1)
		elif moves[i] == "l" or moves[i] == "Lw":
			move_l(1)
			move_m(1)
		elif moves[i] == "L2":
			move_l(2)
		elif moves[i] == "l2" or moves[i] == "Lw2":
			move_l(2)
			move_m(2)
		elif moves[i] == "L'":
			move_l(3)
		elif moves[i] == "l'" or moves[i] == "Lw'":
			move_l(3)
			move_m(3)
		elif moves[i] == "x" or moves[i] == "X":
			move_x(1)
		elif moves[i] == "x2" or moves[i] == "X2":
			move_x(2)
		elif moves[i] == "x'" or moves[i] == "X'":
			move_x(3)
		elif moves[i] == "y" or moves[i] == "Y":
			move_y(1)
		elif moves[i] == "y2" or moves[i] == "Y2":
			move_y(2)
		elif moves[i] == "y'" or moves[i] == "Y'":
			move_y(3)
		elif moves[i] == "z" or moves[i] == "Z":
			move_z(1)
		elif moves[i] == "z2" or moves[i] == "Z2":
			move_z(2)
		elif moves[i] == "z'" or moves[i] == "Z'":
			move_z(3)

	
func update_img():
	for i in centers.size():
		get_node("C"+str(i)).set_modulate(colors[centers[i]])
	for i in corners.size():
		get_node("Co"+str(i)).set_modulate(colors[corners[i]])
	for i in edges.size():
		get_node("E"+str(i)).set_modulate(colors[edges[i]])

func move_z(n):
	var new_centers
	var new_corners
	var new_edges
	
	for i in n:
		new_centers = [centers[1], centers[5], centers[2], 
				centers[0], centers[4], centers[3]]
				
		new_corners  = [corners[7], corners[4], corners[5], corners[6],
				corners[23], corners[20], corners[21], corners[22],
				corners[11], corners[8], corners[9], corners[10],
				corners[3], corners[0], corners[1], corners[2],
				corners[17], corners[18], corners[19], corners[16],
				corners[15], corners[12], corners[13], corners[14]]
				
		new_edges  = [edges[7], edges[4], edges[5], edges[6],
				edges[23], edges[20], edges[21], edges[22],
				edges[11], edges[8], edges[9], edges[10],
				edges[3], edges[0], edges[1], edges[2],
				edges[17], edges[18], edges[19], edges[16],
				edges[15], edges[12], edges[13], edges[14]]
				
		centers = new_centers
		corners = new_corners
		edges = new_edges
	update_img()

func move_x(n):
	var new_centers
	var new_corners
	var new_edges
	for i in n:
		new_centers = [centers[2], centers[1], centers[5], 
				centers[3], centers[0], centers[4]]
				
		new_corners  = [corners[8], corners[9], corners[10], corners[11],
				corners[5], corners[6], corners[7], corners[4],
				corners[20], corners[21], corners[22], corners[23],
				corners[15], corners[12], corners[13], corners[14],
				corners[0], corners[1], corners[2], corners[3],
				corners[18], corners[19], corners[16], corners[17]]
				
		new_edges  = [edges[8], edges[9], edges[10], edges[11],
				edges[5], edges[6], edges[7], edges[4],
				edges[20], edges[21], edges[22], edges[23],
				edges[15], edges[12], edges[13], edges[14],
				edges[2], edges[3], edges[0], edges[1],
				edges[18], edges[19], edges[16], edges[17]]
		centers = new_centers
		corners = new_corners
		edges = new_edges
	update_img()

func move_y(n):
	var new_centers
	var new_corners
	var new_edges
	for i in n:
		new_centers = [centers[0], centers[2], centers[3], 
				centers[4], centers[1], centers[5]]
				
		new_corners  = [corners[3], corners[0], corners[1], corners[2],
				corners[8], corners[9], corners[10], corners[11],
				corners[12], corners[13], corners[14], corners[15],
				corners[16], corners[17], corners[18], corners[19],
				corners[4], corners[5], corners[6], corners[7],
				corners[21], corners[22], corners[23], corners[20]]
				
		new_edges  = [edges[3], edges[0], edges[1], edges[2],
				edges[8], edges[9], edges[10], edges[11],
				edges[12], edges[13], edges[14], edges[15],
				edges[16], edges[17], edges[18], edges[19],
				edges[4], edges[5], edges[6], edges[7],
				edges[21], edges[22], edges[23], edges[20]]
		centers = new_centers
		corners = new_corners
		edges = new_edges
	update_img()

func move_r(n):
	var new_corners
	var new_edges
	for i in n:
		new_corners  = [corners[0], corners[9], corners[10], corners[3],
				corners[4], corners[5], corners[6], corners[7],
				corners[8], corners[21], corners[22], corners[11],
				corners[15], corners[12], corners[13], corners[14],
				corners[2], corners[17], corners[18], corners[1],
				corners[20], corners[19], corners[16], corners[23]]
				
		new_edges  = [edges[0], edges[9], edges[2], edges[3],
				edges[4], edges[5], edges[6], edges[7],
				edges[8], edges[21], edges[10], edges[11],
				edges[15], edges[12], edges[13], edges[14],
				edges[16], edges[17], edges[18], edges[1],
				edges[20], edges[19], edges[22], edges[23]]
		corners = new_corners
		edges = new_edges
	update_img()

func move_u(n):
	var new_corners
	var new_edges
	for i in n:
		new_corners  = [corners[3], corners[0], corners[1], corners[2],
					corners[8], corners[9], corners[6], corners[7],
					corners[12], corners[13], corners[10], corners[11],
					corners[16], corners[17], corners[14], corners[15],
					corners[4], corners[5], corners[18], corners[19],
					corners[20], corners[21], corners[22], corners[23]]
					
		new_edges  = [edges[3], edges[0], edges[1], edges[2],
					edges[8], edges[5], edges[6], edges[7],
					edges[12], edges[9], edges[10], edges[11],
					edges[16], edges[13], edges[14], edges[15],
					edges[4], edges[17], edges[18], edges[19],
					edges[20], edges[21], edges[22], edges[23]]

		corners = new_corners
		edges = new_edges
	update_img()

func move_f(n):
	var new_corners
	var new_edges
	for i in n:
		new_corners  = [corners[0], corners[1], corners[5], corners[6],
					corners[4], corners[20], corners[21], corners[7],
					corners[11], corners[8], corners[9], corners[10],
					corners[3], corners[13], corners[14], corners[2],
					corners[16], corners[17], corners[18], corners[19],
					corners[15], corners[12], corners[22], corners[23]]
					
		new_edges  = [edges[0], edges[1], edges[5], edges[3],
					edges[4], edges[20], edges[6], edges[7],
					edges[11], edges[8], edges[9], edges[10],
					edges[12], edges[13], edges[14], edges[2],
					edges[16], edges[17], edges[18], edges[19],
					edges[15], edges[21], edges[22], edges[23]]

		corners = new_corners
		edges = new_edges
	update_img()

func move_l(n):
	var new_corners
	var new_edges
	for i in n:
		new_corners  = [corners[18], corners[1], corners[2], corners[17],
					corners[7], corners[4], corners[5], corners[6],
					corners[0], corners[9], corners[10], corners[3],
					corners[12], corners[13], corners[14], corners[15],
					corners[16], corners[23], corners[20], corners[19],
					corners[8], corners[21], corners[22], corners[11]]
					
		new_edges  = [edges[0], edges[1], edges[2], edges[17],
					edges[7], edges[4], edges[5], edges[6],
					edges[8], edges[9], edges[10], edges[3],
					edges[12], edges[13], edges[14], edges[15],
					edges[16], edges[23], edges[18], edges[19],
					edges[20], edges[21], edges[22], edges[11]]

		corners = new_corners
		edges = new_edges
	update_img()
	
func move_d(n):
	var new_corners
	var new_edges
	for i in n:
		new_corners  = [corners[0], corners[1], corners[2], corners[3],
					corners[4], corners[5], corners[18], corners[19],
					corners[8], corners[9], corners[6], corners[7],
					corners[12], corners[13], corners[10], corners[11],
					corners[16], corners[17], corners[14], corners[15],
					corners[23], corners[20], corners[21], corners[22]]
					
		new_edges  = [edges[0], edges[1], edges[2], edges[3],
					edges[4], edges[5], edges[18], edges[7],
					edges[8], edges[9], edges[6], edges[11],
					edges[12], edges[13], edges[10], edges[15],
					edges[16], edges[17], edges[14], edges[19],
					edges[23], edges[20], edges[21], edges[22]]

		corners = new_corners
		edges = new_edges
	update_img()
	
func move_b(n):
	var new_corners
	var new_edges
	for i in n:
		new_corners  = [corners[13], corners[14], corners[2], corners[3],
					corners[1], corners[5], corners[6], corners[0],
					corners[8], corners[9], corners[10], corners[11],
					corners[12], corners[22], corners[23], corners[15],
					corners[19], corners[16], corners[17], corners[18],
					corners[20], corners[21], corners[7], corners[4]]
					
		new_edges  = [edges[13], edges[1], edges[2], edges[3],
					edges[4], edges[5], edges[6], edges[0],
					edges[8], edges[9], edges[10], edges[11],
					edges[12], edges[22], edges[14], edges[15],
					edges[19], edges[16], edges[17], edges[18],
					edges[20], edges[21], edges[7], edges[23]]

		corners = new_corners
		edges = new_edges
	update_img()

func move_m(n):
	var new_centers
	var new_edges
	for i in n:
#		move_r(1)
#		move_l(3)
#		move_x(3)
		new_centers = [centers[4], centers[1], centers[0], 
				centers[3], centers[5], centers[2]]
				
		new_edges  = [edges[18], edges[1], edges[16], edges[3],
				edges[4], edges[5], edges[6], edges[7],
				edges[0], edges[9], edges[2], edges[11],
				edges[12], edges[13], edges[14], edges[15],
				edges[22], edges[17], edges[20], edges[19],
				edges[8], edges[21], edges[10], edges[23]]
				
		centers = new_centers
		edges = new_edges
	update_img()

func move_s(n):
	for i in n:
		move_f(3)
		move_b(1)
		move_z(1)

func move_e(n):
	for i in n:
		move_u(1)
		move_d(3)
		move_y(3)

func _on_SolveButton_button_up():
	centers = ori_centers
	corners = ori_corners
	edges = ori_edges
	move_z(2)
	move_y(3)
	update_img()
