# ME401 HW2: Aircraft Dynamics Analysis  

## Description  
This repository contains MATLAB scripts and simulations for analyzing the lateral and longitudinal dynamics of an aircraft. The project includes modeling the aircraft using state-space equations and computing dynamic modes such as roll dynamics, short period mode, Dutch roll mode, and both longitudinal and lateral stability characteristics.  

## Files Included  

### **Main Analysis Script**  
- **File:** ME_401_0007_HW2.m  
- **Topics Covered:**  
  - Modeling aircraft **lateral and longitudinal** dynamics.  
  - Implementing **state-space representations** of dynamic modes.  
  - Plotting **step response comparisons** for Navion and F-104A.  

### **Final Implementation & Pole Analysis**  
- **File:** ME_401_0007_HW2_final.m  
- **Topics Covered:**  
  - Computation of **system poles** for stability assessment.  
  - Extraction of **continuous-time state-space matrices** for dynamic modes.  

### **Project Report**  
- **File:** ME 401-007 HW2.pdf  
- **Contents:**  
  - Explanation of aircraft stability derivatives.  
  - Breakdown of first-order, second-order, and higher-order dynamics.  
  - Discussion on **digital control applications** in future work.  

## Dynamic Modes Analyzed  

1. **First-Order Roll Dynamics** (p)  
   - Characterizes roll stability using **roll damping coefficient (L_p)**.  

2. **Second-Order Short Period Mode** (q, α)  
   - Examines **pitch oscillations** and **angle of attack response**.  

3. **Third-Order Dutch Roll Mode** (β, p, r)  
   - Evaluates yawing and rolling behavior using **yaw damping effects**.  

4. **Fourth-Order Longitudinal Dynamics** (V, α, q, θ)  
   - Simulates **velocity and pitch coupling** in longitudinal motion.  

5. **Fourth-Order Lateral Dynamics** (β, p, r, ϕ)  
   - Models **yaw, roll, and sideslip interactions** in lateral motion.  

## Installation  
Ensure MATLAB is installed before running the scripts.  

### Required MATLAB Toolboxes  
- Control System Toolbox  
- Aerospace Toolbox  

## Usage  
1. Open MATLAB and navigate to the repository folder.  
2. Run the main script using:  
   ME_401_0007_HW2.m  
3. Execute the final pole analysis using:  
   ME_401_0007_HW2_final.m  
4. Review generated figures, including:  
   - **Roll dynamics step response vs. airspeed**.  
   - **Short period and Dutch roll mode comparisons**.  
   - **Longitudinal and lateral response stability visualizations**.  

## Example Output  

- **Roll Dynamics Pole (Navion):**  
  - `-4.0083` (stable)  

- **Short Period Poles (Navion):**  
  - `-0.9724 ± 1.4149i` (oscillatory damping)  

- **Dutch Roll Poles (Navion):**  
  - `-3.9848, 0.2274, -1.5941` (yaw-roll interaction)  

- **Longitudinal Mode Stability:**  
  - `0.0000, 0.0000, -0.9724 ± 1.4149i`  

- **Lateral Mode Poles:**  
  - `-4.0670, 0.1485 ± 0.5543i, -1.5816`  

## Contributions  
This repository is designed for educational and research purposes. Feel free to fork and modify the scripts.  

## License  
This project is open for academic and research use.  

---
**Author:** Alexander Dowell  
