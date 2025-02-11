This project implements a custom Arithmetic Logic Unit (ALU) using Xilinx Vivado, supporting a range of arithmetic and logical operations. 
The ALU is designed to perform:
  * Addition
  * Subtraction (Two’s Complement Representation)
  * Logical Operations: AND, OR, NOT
  * Left Rotation for number 1 operand
  * Right Rotation for number 1 operand 
  * Multiplication
  * Division

Additional Modules

To enhance the functionality and usability of the ALU, several auxiliary components were implemented:
  * Debouncer – Ensures stable input signals by eliminating noise from mechanical switches.
  * MPG (Monopuls Generator Unit)
  * ROM Memory – Stores predefined data or instructions for use within the system.
  * Memory Address Management Unit – Handles memory access and allocation efficiently.
  * 7-Segment Display Driver – Enables real-time visualization of results on a seven-segment display.

Testing and Verification
A test environment (test_env unit) was developed to rigorously verify the correct implementation of all modules. Each component, including the ALU and supporting units, is tested using a dedicated testbench, ensuring functional correctness and expected behavior.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Acest proiect implementează o Unitate Aritmetico-Logică (ALU) personalizată utilizând Xilinx Vivado, suportând o gamă variată de operații aritmetice și logice.

ALU este proiectată pentru a efectua:
  * Adunare
  * Scădere (reprezentare în Complement față de 2)
  * Operații logice: AND, OR, NOT
  * Rotire la stânga pentru operandul 1
  * Rotire la dreapta pentru operandul 1
  * Înmulțire
  * Împărțire

Module suplimentare

Pentru a îmbunătăți funcționalitatea și utilizarea ALU, au fost implementate mai multe componente auxiliare:
  * Debouncer – Asigură semnale de intrare stabile prin eliminarea zgomotului generat de comutatoarele mecanice.
  * MPG (Monopuls Generator Unit)
  * Memorie ROM – Stochează date sau instrucțiuni predefinite utilizate în sistem.
  * Unitate de gestionare a adreselor de memorie – Administrează eficient accesul și alocarea memoriei.
  * Driver pentru afișaj cu 7 segmente – Permite vizualizarea rezultatelor în timp real pe un afișaj cu șapte segmente.

Testare și verificare
A fost dezvoltat un mediu de testare (unitatea test_env) pentru a verifica riguros implementarea corectă a tuturor modulelor. Fiecare componentă, inclusiv ALU și unitățile de suport, au fost testate folosind un testbench dedicat, asigurând corectitudinea funcțională și comportamentul așteptat.
