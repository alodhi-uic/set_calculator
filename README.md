# Set Calculator

This Ruby-based Set Calculator application allows you to perform set operations on two sets, X and Y. Set X is implemented as a Binary Search Tree (BST) through the `BranchingSet` class, while set Y is implemented as a sorted array using the `ArrayedSet` class. The calculator offers various commands to manipulate and view these sets, as well as perform operations like union, intersection, and more.

## Features

- **Binary Search Tree (BST)** for set X.
- **Sorted array** for set Y.
- Supports operations like **swap**, **union**, **intersection**, and applying **lambda expressions** to set elements.
- **No duplicates** allowed in either set.
- **Semantic equivalence** is used for comparison, ensuring numbers with the same value (even if different representations) are treated as equal.

## Requirements

- Ruby 2.5 or higher.

## Setup Instructions

1. Clone this repository.
2. Navigate to the project folder. `~/set_calculator`
3. Run the main Ruby script:

```bash
Ruby lib/main.rb
```

## Commands
```bash
> X 1,2,3,4 
> Y 11,22,33,44
> l
> lx
> ly 
> m -> (y){y*2}
> a 10
> x
> u
> i
> type 
> q
```