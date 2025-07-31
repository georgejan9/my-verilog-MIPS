

## 🔧 Modules in `src/`

### 🧠 Core Components
- `MIPS_processor.v`  
- `MIPS_processor_with_debouncer.v`  

### 🖩 ALU & Arithmetic
- `ALU.v`  
- `ALU_control.v`  
- `Arithmetic_unit.v`  
- `FA.v`  
- `adder.v`  
- `add_4.v`  
- `RCA.v`  

### 🧮 Logic Units
- `Logic_unit.v`  
- `Shift_lui_unit.v`  
- `shift_left_2_26_28.v`  
- `shift_left_2_32_32.v`  

### 🔁 Multiplexers
- `MUX.v`  
- `MUX_4_1.v`  

### 💾 Memory & Registers
- `Instruction_memory.v`  
- `Data_memory.v`  
- `Registers.v`  

### 🧭 Control Units
- `Control.v`  
- `ALU_control.v`  
- `Branch_control.v`  
- `extend_unit.v`  
- `concatenation_unit.v`  

### 🕹️ Utility
- `PC.v`  
- `debouncer.v`  

---

## 🧪 Testbenches in `tb/`

Each module is tested with a corresponding testbench to verify functionality.

- `MIPS_processor_tb.v`  
- `MIPS_processor_with_debouncer_tb.v`  
- `ALU_tb.v`  
- `ALU_control_tb.v`  
- `Arithmetic_unit_tb.v`  
- `add_4_tb.v`  
- `adder_tb.v`  
- `Branch_control_tb.v`  
- `Control_tb.v`  
- `Data_memory_tb.v`  
- `extend_unit_tb.v`  
- `Instruction_memory_tb.v`  
- `Logic_unit_tb.v`  
- `MUX_4_1_tb.v`  
- `PC_tb.v`  
- `Registers_tb.v`  
- `shift_left_2_26_28_tb.v`  
- `shift_left_2_32_32_tb.v`  
- `Shift_lui_unit_tb.v`  

---

## 🚀 Features

- Implements a simplified **single-cycle MIPS** architecture.
- Modular design for ease of understanding and reusability.
- Instruction support includes arithmetic, logical, branching, shifting, memory access.
- Fully testable using simulation environments.

---

## ▶️ Simulation using ModelSim
Create a new ModelSim project

Add all files from src/ and tb/

Set your testbench (e.g. MIPS_processor_tb.v) as the top module

Compile and run the simulation

## 🧠 Supported MIPS Instructions
This Verilog-based MIPS processor supports a wide variety of instructions from the MIPS instruction set architecture, including R-type, I-type, J-type, and a few custom/extended instructions.

### 🟩 R-Type Instructions
R-type instructions use three registers (rs, rt, rd) and are identified by an opcode of 0. The operation is specified by the funct field. Supported R-type instructions:

add – Add (funct = 32)

sub – Subtract (funct = 34)

and – Bitwise AND (funct = 36)

or – Bitwise OR (funct = 37)

xor – Bitwise XOR (funct = 38)

nor – Bitwise NOR (funct = 39)

slt – Set on Less Than (funct = 42)

sll – Logical Shift Left (funct = 0)

srl – Logical Shift Right (funct = 2)

sra – Arithmetic Shift Right (funct = 3)

jr – Jump Register (funct = 8)

lwr – Load Word Right (funct = 20) (custom)

sbit – Store Bit (custom)

### 🟨 I-Type Instructions
I-type instructions use two registers and a 16-bit immediate value. These are used for arithmetic with immediates, memory access, and branches. Supported I-type instructions:

addi – Add Immediate (opcode = 8)

andi – AND Immediate (opcode = 12)

ori – OR Immediate (opcode = 13)

xori – XOR Immediate (opcode = 14)

slti – Set on Less Than Immediate (opcode = 10)

subi – Subtract Immediate (opcode = 51) (custom)

beq – Branch if Equal (opcode = 4)

bne – Branch if Not Equal (opcode = 5)

lw – Load Word (opcode = 35)

lui – Load Upper Immediate (opcode = 15)

sw – Store Word (opcode = 43)

#lb – Load Byte (opcode = 32)

#lh – Load Halfword (opcode = 33)

#sb – Store Byte (opcode = 40)

#sh – Store Halfword (opcode = 41)

### 🟦 J-Type Instructions
J-type instructions handle unconditional jumps and linking. These use a 26-bit target address field.

j – Jump (opcode = 2)

jal – Jump and Link (opcode = 3)

jalr – Jump and Link Register (opcode = 53)

jm – Custom Jump (opcode = 54)

jalm – Custom Jump (opcode = 52)

### 🟪 Custom and Extended Instructions
The design also includes custom or extended instructions beyond the standard MIPS ISA:

lbit – Load Bit (opcode = 49)

sbit – Store Bit (opcode = 50)

jalm – Custom Jump (opcode = 52)

subi – Subtract Immediate (opcode = 51)

jm – Custom Jump (opcode = 54)

jalr – Jump and Link Register (opcode = 53)

lwr – Load Word Right (funct = 20) (custom)

## ⚙️ Tools Used
Verilog HDL

ModelSim,vivado,Quartus



## ✍️ Author
George Jan

## 📁 Folder Structure
```
my-verilog-MIPS/
│
├── src/                      # Verilog source files
│   ├── add_4.v
│   ├── adder.v
│   ├── ALU.v
│   ├── ALU_control.v
│   ├── Arithmetic_unit.v
│   ├── Branch_control.v
│   ├── concatenation_unit.v
│   ├── Control.v
│   ├── Data_memory.v
│   ├── debouncer.v
│   ├── extend_unit.v
│   ├── FA.v
│   ├── Instruction_memory.v
│   ├── Logic_unit.v
│   ├── MIPS_processor.v
│   ├── MIPS_processor_with_debouncer.v
│   ├── MUX.v
│   ├── MUX_4_1.v
│   ├── PC.v
│   ├── RCA.v
│   ├── Registers.v
│   ├── shift_left_2_26_28.v
│   ├── shift_left_2_32_32.v
│   └── Shift_lui_unit.v
│
├── tb/                       # Testbenches
│   ├── add_4_tb.v
│   ├── adder_tb.v
│   ├── ALU_tb.v
│   ├── ALU_control_tb.v
│   ├── Arithmetic_unit_tb.v
│   ├── Branch_control_tb.v
│   ├── Control_tb.v
│   ├── Data_memory_tb.v
│   ├── extend_unit_tb.v
│   ├── Instruction_memory_tb.v
│   ├── Logic_unit_tb.v
│   ├── MIPS_processor_tb.v
│   ├── MIPS_processor_with_debouncer_tb.v
│   ├── MUX_4_1_tb.v
│   ├── PC_tb.v
│   ├── Registers_tb.v
│   ├── shift_left_2_26_28_tb.v
│   ├── shift_left_2_32_32_tb.v
│   └── Shift_lui_unit_tb.v
│
├── report/                   # Project documentation
│   └── MIPS_Project.pdf
│
└── README.md

```
