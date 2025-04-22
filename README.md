# Network Flood Routing Analysis

This repository contains MATLAB scripts for analysing network topologies and simulating network flood routing protocols. It focuses on communication networks where packets are transmitted using flooding-based routing mechanisms, often used in dynamic or resource-constrained environments.

## Contents

### 1. `network_topology.m`
- **Purpose**: Analyses a 25-node directed communication network by:
  - Visualising the network topology.
  - Converting the network to an undirected graph for analysis.
  - Finding the shortest and all possible paths between specified nodes.
- **Outputs**:
  - Visual plots of the network.
  - Graph highlighting the shortest path.
  - Console output of all valid paths with TTL (Time-To-Live) ≤ 10 hops.
  - Saves the network structure to `network_topology_undirected.mat`.

### 2. `flood_routing_simulation.mlx`
- **Purpose**: Simulates data packet transmission through a network using basic flood routing principles.
- **Features**:
  - Models packet flow across nodes based on the network topology.
  - Calculates route propagation, delays, and hop counts.
- **Note**: Before running this file, either:
  - Run `network_topology.m` to generate `network_topology_undirected.mat`, or
  - Ensure `network_topology_undirected.mat` is saved in the same folder.

### 3. `flood_routing_simulation_optimised.mlx`
- **Purpose**: Optimised version of the flood routing simulation for improved performance and efficiency.
- **Features**:
  - Enhanced routing algorithms.
  - Reduced computational complexity.
  - More efficient handling of TTL constraints and duplicate packet suppression.
- **Note**: Before running this file, either:
  - Run `network_topology.m` to generate `network_topology_undirected.mat`, or
  - Ensure `network_topology_undirected.mat` is saved in the same folder.

## Requirements
- MATLAB R2021b or later.
- MATLAB Graph and Network Algorithms Toolbox (for `network_topology.m`).

## Usage
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/network-flood-routing-analysis.git
   cd network-flood-routing-analysis
