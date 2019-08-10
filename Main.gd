extends Node
var list = [  "apple","turnip","banana","clock","cup","flower","fork","glasses","oranage","pencil","spoon"]
var selected_word
var selected_word_breakdown = []
var letters_needed
var hidden_word = []
var hangman_lives = 0
var secret_word

func _ready():
	randomize()
	new_game()
	
func new_game():
	choose_random_word()
	breakdown_random_word()
	prepare_hidden_word()
	convert_to_string()
	load_image()

#Chooses a random word from the list array 
func choose_random_word():
	selected_word = list[randi()%list.size()]
	print(selected_word)

#Creates a new array with the choosen word seperating each letter into a new part of the array
func breakdown_random_word():
	for letters in selected_word:
		selected_word_breakdown.append(letters)
		
	
#Uses the selected word again to create a new array with hidden 
#Values that can be displayed to the player
func prepare_hidden_word():
	for letters in selected_word:
		hidden_word.append("_ ")

#searches through the breakdown array for the _single_letter input to see if any
#part of the array has that letter in it. if it does than it finds the count value
#and uses that value as the array position for the hidden_word array and replaces its
# "_ " value with the "_single_letter" value +" " so that it remains seperated to the user
func check_word_for_letter(_single_letter):
	var count = 0
	var letter_found1 = false
	for i in selected_word_breakdown:
		if _single_letter == i:
			hidden_word[count] = i+" "
			letter_found1 = true
		count += 1
		convert_to_string()
	if !letter_found1:
		check_for_hangman()
	check_win_condition()

#converts the hidden_word array into a string that is than displayed to the
#player.
func convert_to_string():
	secret_word = PoolStringArray(hidden_word).join("")
	$MarginContainer/Area_Guess/HBoxContainer/VBoxContainer/HiddenWordText.text = secret_word

# This is proberly the most complicated thing I did, because secret_word had spaces
# for the player I needed to remove the spaces to compare it against the selcted orginal word
# so that I knew if the player had won. so we duplicate the variables so that we dont alter them
# than we search word1 for spaces and remove them by appending to a new variable in word3
# than we remove the array and turn it back into a string without spaces in word4
# than we compare it to the orginal selected word if they match the player wins.
func check_win_condition():
	var word1 = secret_word
	var word2 = selected_word
	var word3 = []
	var word4
	for i in word1:
		if !i == " ":
			word3.append(i)
	word4 = PoolStringArray(word3).join("")
	if word4 == word2:
		end_game()

#shows the restart game function
func end_game():
	$MarginContainer/Area_Input/VBoxContainer/HBoxContainer/RestartButton.show()

#when the game loads it creates and image address by using the selected word string
#and places it within the image_address variable. than it sets the texture_rect image to
#load the new address that relates as a hint to the selected word.
func load_image():
	var image_address = "res://Images/Word_Images/"+selected_word+".png"
	$MarginContainer/Area_Guess/HBoxContainer/ImageHint.texture = load(image_address)

#checks to see if the man has been hung by running out of lives. if it hasn't it increments
#the image by changing the string and reloading the texture_rect associated with it. in the
#same way we do for the load image function.
func check_for_hangman():
	hangman_lives += 1
	if hangman_lives >= 8:
		end_game()
	else:
		var hangman_image_address = "res://Images/Hangman_Images/hangman"+str(hangman_lives)+".png"
		$MarginContainer/Area_Guess/HBoxContainer/HangManImage.texture = load(hangman_image_address)
	
# button Presses ----------------------------------------------------->
# A button for every letter of the alphabet that forwards its equivelent into the
# check_word_for_letters function than disables it self so it can't be pressed again
func _on_A_pressed():
	check_word_for_letter("a")
	$MarginContainer/Area_Input/Area_Letters1/A.disabled = true


func _on_B_pressed():
	check_word_for_letter("b")
	$MarginContainer/Area_Input/Area_Letters1/B.disabled = true

func _on_C_pressed():
	check_word_for_letter("c")
	$MarginContainer/Area_Input/Area_Letters1/C.disabled = true


func _on_D_pressed():
	check_word_for_letter("d")
	$MarginContainer/Area_Input/Area_Letters1/D.disabled = true

func _on_E_pressed():
	check_word_for_letter("e")
	$MarginContainer/Area_Input/Area_Letters1/E.disabled = true

func _on_F_pressed():
	check_word_for_letter("f")
	$MarginContainer/Area_Input/Area_Letters1/F.disabled = true

func _on_G_pressed():
	check_word_for_letter("g")
	$MarginContainer/Area_Input/Area_Letters1/G.disabled = true

func _on_H_pressed():
	check_word_for_letter("h")
	$MarginContainer/Area_Input/Area_Letters1/H.disabled = true

func _on_I_pressed():
	check_word_for_letter("i")
	$MarginContainer/Area_Input/Area_Letters1/I.disabled = true

func _on_J_pressed():
	check_word_for_letter("j")
	$MarginContainer/Area_Input/Area_Letters1/J.disabled = true

func _on_K_pressed():
	check_word_for_letter("k")
	$MarginContainer/Area_Input/Area_Letters1/K.disabled = true

func _on_L_pressed():
	check_word_for_letter("l")
	$MarginContainer/Area_Input/Area_Letters1/L.disabled = true

func _on_M_pressed():
	check_word_for_letter("m")
	$MarginContainer/Area_Input/Area_Letters1/M.disabled = true

func _on_N_pressed():
	check_word_for_letter("n")
	$MarginContainer/Area_Input/Area_Letters1/N.disabled = true

func _on_O_pressed():
	check_word_for_letter("o")
	$MarginContainer/Area_Input/Area_Letters1/O.disabled = true

func _on_P_pressed():
	check_word_for_letter("p")
	$MarginContainer/Area_Input/Area_Letters2/P.disabled = true

func _on_Q_pressed():
	check_word_for_letter("q")
	$MarginContainer/Area_Input/Area_Letters2/Q.disabled = true

func _on_R_pressed():
	check_word_for_letter("r")
	$MarginContainer/Area_Input/Area_Letters2/R.disabled = true

func _on_S_pressed():
	check_word_for_letter("s")
	$MarginContainer/Area_Input/Area_Letters2/S.disabled = true

func _on_T_pressed():
	check_word_for_letter("t")
	$MarginContainer/Area_Input/Area_Letters2/T.disabled = true

func _on_U_pressed():
	check_word_for_letter("u")
	$MarginContainer/Area_Input/Area_Letters2/U.disabled = true

func _on_V_pressed():
	check_word_for_letter("v")
	$MarginContainer/Area_Input/Area_Letters2/V.disabled = true

func _on_W_pressed():
	check_word_for_letter("w")
	$MarginContainer/Area_Input/Area_Letters2/W.disabled = true

func _on_X_pressed():
	check_word_for_letter("x")
	$MarginContainer/Area_Input/Area_Letters2/X.disabled = true
	

func _on_Y_pressed():
	check_word_for_letter("y")
	$MarginContainer/Area_Input/Area_Letters2/Y.disabled = true
	

func _on_Z_pressed():
	check_word_for_letter("z")
	$MarginContainer/Area_Input/Area_Letters2/Z.disabled = true

func _on_RestartButton_pressed():
	get_tree().reload_current_scene()
