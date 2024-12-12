# Washing Machine FSM Project

## Project Overview
This project implements a finite state machine (FSM) to model the operation of a washing machine. The design is written in Verilog and includes a testbench for functional verification. The washing machine progresses through various stages: **Idle**, **Fill**, **Wash**, **Rinse**, **Spin**, and **Done**.

### Features:
- FSM design in Verilog.
- Parameterized timing for each stage.
- Simulation of power supply interruptions.
- Testbench for verifying behavior under different scenarios.

---

## FSM Model

### States:
1. **Idle (IDEL)**: Default state when the washing machine is not in operation.
2. **Fill (FILL)**: The machine fills with water.
3. **Wash (WASH)**: Washing clothes.
4. **Rinse (RINSE)**: Rinsing clothes.
5. **Spin (SPIN)**: Spinning clothes to remove water.
6. **Done (DONE)**: Washing cycle completed.

### State Transitions:
- Transitions are controlled by:
  - **Clock signal** (`clk`)
  - **Reset signal** (`rst`)
  - **Cycle start** (`cycle`)
  - **Supply status** (`supply`)
  
- Timing for each state is parameterized as:
  - Fill: 3 cycles
  - Wash: 4 cycles
  - Rinse: 4 cycles
  - Spin: 4 cycles

#### FSM Diagram:
![FSM Model](#)

---

## Verilog Modules

### Main Module: `washing_machine`
#### Inputs:
- `clk`: Clock signal
- `rst`: Reset signal
- `cycle`: Start signal for the washing cycle
- `supply`: Power supply status

#### Outputs:
- `stage`: 3-bit signal representing the current state

#### Parameters:
- `FILL_TIME`, `WASH_TIME`, `RINSE_TIME`, `SPIN_TIME`: Cycle durations for respective stages.

### Testbench: `washing_machine_tb`
#### Features:
- Simulates clock and reset signals.
- Tests supply interruptions.
- Monitors state transitions.
- Outputs results in the simulation log.

---

## Testbench Results
![image](https://github.com/user-attachments/assets/a8281e02-59f1-4895-87c0-addcc1fba243)

---

## Simulation Environment
- **Software**: Vivado
- **Language**: Verilog
- **Clock Period**: 10 time units

---

## How to Run the Simulation
1. Clone the repository:
   ```bash
   git clone <repo-url>
   cd <repo-directory>
   ```
2. Open the project in your Verilog simulation tool.
3. Compile the design and testbench files.
4. Run the simulation:
   ```bash
   vsim -do run.do
   ```
5. Observe the simulation results.

---

## Files in the Repository
1. **`washing_machine.v`**: Verilog code for the FSM.
2. **`washing_machine_tb.v`**: Testbench for the FSM.
3. **`README.md`**: Project documentation (this file).

---

## Future Enhancements
- Add a user-friendly display module for real-time state updates.
- Incorporate error handling for supply interruptions.
- Extend the FSM to include additional stages like Pre-Wash and Dry.

---

## References
- Verilog Language Reference Manual
- Finite State Machine Design Principles

---
