# Solution to Second Order ODE using Taylor Series & Interval Analysis
---

## Overview

This repository contains all relevant files for the B.Tech Project titled **"Solution to Second Order ODE using Taylor Series & Interval Analysis"** by Yash Kumar and Lokendra Singh Gohil. The objective of this work is to solve the differential equation associated with the classical **brachistochrone problem** using Taylor series approximation and interval analysis techniques to compute rigorous bounds of the solution.

---
## Julia Code Setup

Ensure you have the following installed:

Julia

Install required packages by running the following in the Julia REPL:

using Pkg
Pkg.add(["Pluto", "IntervalArithmetic", "IntervalBoxes", "Plots", "ForwardDiff", "LinearAlgebra"])

## Julia Code Execution 

Running the Pluto Notebook (Interval Dynamic Programming)
Launch Julia REPL.

Run the following commands:

using Pluto
Pluto.run()
This opens Pluto in your browser.

Click "Open from file" and select:

Final_Presentation.pdf   
Final presentation for the project

Coefficient_Equations.jl    
Run the cells to produce the equations obtained by equating coefficients of like powers based on the order of approximation (variable n)

Estimate_calculator_and_Plotter.py    
Code for calculations of the point form estimate of the solution

a1_bound_calculation_code.jl    
Julia code for estimating the bounds of a1 for lower bound calculations


