# Iterated Prisoner's Dilemma Game Analysis

## Overview
This repository hosts the MATLAB implementation and analysis of the Iterated Prisoner's Dilemma (IPD) game, focusing on coevolutionary simulations. The project explores deterministic reactive memory-one strategies in a two-player IPD game setting, investigates the impact of various mutations, and examines the evolution of cooperative versus defecting strategies under different conditions.

## Experiment Setup
- **Game Description:** IPD game with two choices (Defect and Cooperate), and payoffs T = 5, R = 3, P = 1, S = 0 over N = 100 rounds.
- **Strategy Implementation:** Players use a deterministic reactive memory-one strategy, represented by a look-up table.
- **Simulation Environment:** MATLAB, using Mersenne Twister for random number generation with seeds based on student ID.

## Key Experiments
1. **Coevolutionary Simulation:** 
   - Population of 20 agents with random initial strategies.
   - Round-robin tournament with a (10,20)-selection process.
   - Simple mutation operator at 1% for offspring generation.
   - 100 generations with plots of the best agent's average payoff.

2. **Multiple Trials with Varied Seeds:** 
   - Repeat of the first simulation with 100 different seed numbers.
   - Analysis of the best generational strategy's average payoff.

3. **All-Defect Initial Population:** 
   - Modification of the initial setup with All-Defect strategies.
   - Exploration of the possibility of evolution to cooperation.

4. **Introduction of Noise and Payoff Variations:** 
   - Simulations with noise introduction at various probabilities.
   - Adjustments to the payoff T and its impact on strategy evolution.

## Graphs and Visualizations
Graphs plotting the average payoffs, strategy evolutions, and the impacts of various conditions are included. These graphs are consistently scaled on their axes for clarity and comparability.

