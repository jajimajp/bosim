# BO simulator

## Dependency

ocamlopt

## Installation

Clone this repository and run:

```sh
cd bosim
make && make install
```

## Usage

To calculate the probability of a person with a win rate of 0.6 in a single game winning a best-of-five match:

```sh
bosim 0.6 5
```

computes and outputs `0.682560`.

