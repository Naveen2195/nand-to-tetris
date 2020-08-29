// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.


	@fillvalue
	M=0  //fill white by default
	
(LOOP)
	@SCREEN
	D=A
	@addr
	M=D  //addr=16384 base addr of screen. Shouldn't exceed 25573

	@KBD
	D=M
	@FILLONE
	D;JGT

//else fill zero(white)
	@fillvalue
	M=0  //fillzero variable =0000...0
	@FILLSCREEN
	0;JMP

(FILLONE)
	@fillvalue
	M=-1	

(FILLSCREEN)
	@fillvalue
	D=M
	@addr
	A=M
	M=D
	@addr
	M=M+1
	D=M

//stop at 24575

	@24576
	D=D-A
	@FILLSCREEN
	D;JLT

	@LOOP
	0,JMP

