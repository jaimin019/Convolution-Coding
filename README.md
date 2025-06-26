# 🔄 Convolutional Coding Simulation & Performance Evaluation

This project implements and analyzes **convolutional coding** in **MATLAB**, focusing on both **hard** and **soft decision Viterbi decoding**. The simulation examines how varying **constraint lengths** and **generator polynomials** impact **Bit Error Rate (BER)**, **Frame Error Rate (FER)**, and **Frame Success Rate** under different noise levels.

---

## 🧠 Key Concepts & Learning Outcomes

- Fundamentals of **convolutional encoding** and **Viterbi decoding**
- Implementation of **trellis structures** and **state transitions**
- Difference between **hard** and **soft decision decoding**
- Analysis of performance metrics:
  - 📉 **Bit Error Rate (BER)**
  - 🔁 **Frame Error Rate (FER)**
  - ✅ **Frame Success Rate**
- Understanding the influence of **SNR** on decoding performance

---

## 📘 Theory (Report.pdf)

The attached report provides:

- Derivation of the **transfer function** of convolutional codes  
- Calculation of **minimum free distance**
- Upper bound estimation on BER using **union bound** and **Q-function**
- Comparative analysis between hard and soft decision decoding  
- Performance evaluation on **AWGN** and **BSC** channels

---

## ⚙️ Simulation Parameters

### Test Cases:

| Case | Constraint Length (K) | Generator Polynomials |
|------|------------------------|------------------------|
| 1    | 3                      | (101), (111)           |
| 2    | 4                      | (1101), (1111), (1001) |
| 3    | 6                      | (101111), (111001), (110101) |

### Channel Model:
- **AWGN** (Additive White Gaussian Noise)
- **BPSK Modulation**

### SNR Range:
- 0 dB to 10 dB (in 0.5 dB steps)

---

## 📈 Output Metrics

Each simulation run generates:
- BER vs. SNR plots
- FER vs. SNR plots
- Frame success trends
- Comparative performance graphs for hard vs. soft decoding

---

## 🛠️ Tools Used
- **MATLAB R2022a**

---



