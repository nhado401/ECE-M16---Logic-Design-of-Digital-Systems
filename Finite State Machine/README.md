# ECE-M16---Finite State Machine
This is the second design project involving to Finite State Machine
The design is about Sequential Control Logic in which we implement verilog code for a simple electronic kitchen appliance: a bread machine.

To use such a machine, the user can simply pour the various ingredients into the machine, select the
appropriate program, and press the start button. After that, the automated machine performs its
three pre-programmed phases:
1. The ingredients are combined into a dough which is kneaded using a rotating paddle at the
bottom of the machine.
2. The kneaded dough is proofed (i.e. the dough is allowed to rest and rise).
3. The proofed dough is baked using a resistive heating element.
At the end of the third phase, a sound is emitted to indicate to the user that the bread loaf is ready.

For simplicity, the bread machine considered in this project only supports one baking program.

After first being powered on, the bread machine should not do anything until the start button is
pressed. When this button is pressed, the machine should start its bread making program:
1. The paddle motor is activated (paddle motor = 1) during 15 minutes1 to knead the dough.
2. The paddle motor then stops (paddle motor = 0), and the machine waits for 2 hours1 to proof
the dough.
3. The heating element is then powered (heating element = 1) for 25 minutes1 to bake the dough.
4. The baking stops (heating element = 0), and the machine produces a brief sound (bell = 1).
After finishing its program, the machine can be used to make another bread loaf by pressing once
again the start button. Any button press during an active program should be ignored.

The DataPath in this project was given, we only need to implement the control module, which is a FSM.
