# Replication Study of Towards Understanding How Machines Can Learn Causal Overhypotheses

[Original paper](https://github.com/CannyLab/causal_overhypotheses.git)

[Original code](https://arxiv.org/abs/2206.08353)

## Scripts
An example of the script we used to run the RL models on the ILCC clisters can be found in `scripts/run_replication7.sh`.
## Data

### GPT-3
Data for our replications of GPT-3 experiments can be found in `./Replication_Data/gpt3/` with all text prompts and outputs per condition.

### RL
The RL model outputs are saved in `./Replication_Data/rl_data/`.
The shell script `extract_data.sh` extracts the raw `.out` data and saves each model run to a CSV.
The R script `test.R` reads the CSV data and makes a plot of the model rewards throughout training.
