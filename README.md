# Improved Imperialist Competitive Algorithm Using a Popularity Parameter

**Thesis author:** Zohre Nazari  
**Field:** Telecommunication Engineering  
**Project:** Bachelor's graduation thesis implemented in MATLAB

## Background

The **Imperialist Competitive Algorithm (ICA)** is a population-based optimization algorithm introduced by **Esmaeil Atashpaz-Gargari** and **Caro Lucas** in **2007**. It models competition among empires as a method for solving optimization problems.

## My thesis modification

For my undergraduate thesis, *Improvement of the Imperialist Competitive Algorithm Using a Novel Popularity Parameter*, I, **Zohre Nazari**, studied a modification of ICA using a **Popularity parameter (Q)**.

In this implementation, `Q` is calculated from changes in the number of colonies held by each empire relative to its initial number. The value is then used to update **zeta (ζ)**, a coefficient involved in calculating an empire's total cost. This allows zeta to vary across empires rather than remaining at one fixed value.

I worked with MATLAB to implement this change and examine the algorithm using the **Ackley benchmark function**. The modification is implemented in `UpdateZeta.m` and called from the main script at iteration 20.

## Project files and settings

The `Popularity_Modified_ICA/` folder contains the main MATLAB script (`ica.m`), the popularity-based update (`UpdateZeta.m`), and supporting functions. The thesis settings used here are **100 iterations**, **100 countries**, **10 initial empires**, and **5 variables**.

To run the code, open the folder in MATLAB, set it as the current folder, and run `ica.m`. The script is set up to report best and mean costs and plot their progression.

## Credits and attribution

- **Original ICA algorithm:** Esmaeil Atashpaz-Gargari and Caro Lucas (2007).
- **Baseline MATLAB implementation:** S. Mostapha Kalami Heris, credited in the supplied source code (MATLABSITE.com, version 1.9, May 2010).
- **Thesis author and popularity-based modification:** **Zohre Nazari**, adjustment of zeta (ζ) using the Popularity parameter (Q) as part of my Bachelor's project.
- The MATLAB implementation was successfully executed for 100 iterations using the Ackley benchmark function. In this run, the final best cost reached approximately 1.38 × 10⁻⁵.

The thesis modification is distinct from the original ICA algorithm and the pre-existing MATLAB implementation. Any redistribution of third-party source files remains subject to the original authors' applicable permissions.
