% NETWORK_TOPOLOGY.M
% -------------------------------------------------------------------------
% Description: 
%   This script analyses a 25-node network topology, including visualisation
%   and path analysis between specified nodes. The network is initially
%   defined as a directed graph and then converted to undirected for analysis.
%
% Key Functionality:
%   1. Creates and visualises network topology from adjacency matrix
%   2. Converts directed graph to undirected representation
%   3. Finds and highlights shortest path between two nodes
%   4. Enumerates all possible paths between nodes with TTL constraint
%   5. Saves network structure for use in other simulations
%
% Inputs:
%   Hard-coded 25x25 adjacency matrix (directed)
%
% Outputs:
%   1. Network visualisation plots
%   2. 'network_topology_undirected.mat' file containing graph data
%   3. Console output of all valid paths between specified nodes
%
% Parameters:
%   - TTL (Time-To-Live): Maximum allowed path length (default: 10 hops)
%   - Source/Destination nodes for path analysis (default: 3 → 10)
%
% Dependencies:
%   - MATLAB Graph and Network Algorithms toolbox
%
% Created: [19-04-2025]
% Last Modified: [19-04-2025]
% Author: Harris Lee
% Student ID: 2631617
% -------------------------------------------------------------------------

clc; clear all; close all;

% adjacency matrix (directed)
adjacencyMatrix = [...
0  0  0  0  0  0  0  0  0  0  0  0  0  1  0  0  0  0  0  0  0  0  0  1  0  ;
0  0  0  0  0  0  0  0  0  0  1  1  1  0  0  0  0  0  0  0  0  1  1  1  0  ;
0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  1  0  0  0  0  0  1  ;
0  0  0  0  1  1  0  1  0  0  0  1  0  0  1  1  0  0  0  0  0  0  0  0  0  ;
0  0  0  1  0  1  0  0  0  0  0  1  0  0  0  0  0  0  0  0  0  1  0  0  0  ;
0  0  0  1  1  0  1  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  ;
0  0  0  0  0  1  0  0  0  0  0  0  0  0  0  0  0  1  0  0  1  0  0  0  0  ;
0  0  0  1  0  0  0  0  0  0  0  0  0  0  0  1  0  0  0  1  0  0  0  0  0  ;
0  0  0  0  0  0  0  0  0  0  0  0  0  0  1  1  0  0  0  1  0  0  0  0  1  ;
0  0  0  0  0  0  0  0  0  0  0  0  0  1  0  0  0  0  0  0  1  0  0  0  0  ;
0  1  0  0  0  0  0  0  0  0  0  1  0  0  0  0  1  0  1  0  0  0  0  0  1  ;
0  1  0  1  1  0  0  0  0  0  1  0  0  0  1  0  0  0  0  0  0  0  0  0  1  ;
0  1  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  1  1  0  ;
1  0  0  0  0  0  0  0  0  1  0  0  0  0  0  0  0  1  0  0  0  1  0  0  0  ;
0  0  0  1  0  0  0  0  1  0  0  1  0  0  0  1  0  0  0  0  0  0  0  0  1  ;
0  0  0  1  0  0  0  1  1  0  0  0  0  0  1  0  0  0  0  1  0  0  0  0  0  ;
0  0  0  0  0  0  0  0  0  0  1  0  0  0  0  0  0  0  0  0  0  0  1  0  0  ;
0  0  0  0  0  1  1  0  0  0  0  0  0  1  0  0  0  0  0  0  1  1  0  0  0  ;
0  0  1  0  0  0  0  0  0  0  1  0  0  0  0  0  0  0  0  0  0  0  0  0  1  ;
0  0  0  0  0  0  0  1  1  0  0  0  0  0  0  1  0  0  0  0  0  0  0  0  0  ;
0  0  0  0  0  0  1  0  0  1  0  0  0  0  0  0  0  1  0  0  0  0  0  0  0  ;
0  1  0  0  1  0  0  0  0  0  0  0  0  1  0  0  0  1  0  0  0  0  0  1  0  ;
0  1  0  0  0  0  0  0  0  0  0  0  1  0  0  0  1  0  0  0  0  0  0  0  0  ;
1  1  0  0  0  0  0  0  0  0  0  0  1  0  0  0  0  0  0  0  0  1  0  0  0  ;
0  0  1  0  0  0  0  0  1  0  1  1  0  0  1  0  0  0  1  0  0  0  0  0  0  ;
];

% Convert to undirected by symmetrizing
adjMatrixUndirected = adjacencyMatrix | adjacencyMatrix';

% Create the undirected graph
G = graph(adjMatrixUndirected);
% [bins,binsizes] = conncomp(G); % to double check connection group

% Plot
figure('Color', 'w'); % Sets figure background to white
ax = gca;             % Get current axes
ax.Color = 'w';       % Sets axes background to white

plot(G, 'Layout', 'force', 'LineWidth', 1, 'MarkerSize', 6);
title('Network Topology (25 Nodes)');
axis off;

% Save to .mat
save('network_topology_undirected.mat', 'G', 'adjMatrixUndirected');

% Find the shortest path
[Path3_10,d3_10] = shortestpath(G,3,10)

% Highlight shortest path on the graph
figure(2); clf;
set(gcf, 'Color', 'w');
ax2 = gca;
ax2.Color = 'w';
p = plot(G, 'Layout', 'force', 'LineWidth', 1, 'MarkerSize', 6);
title('Shortest Path from Node 3 to Node 10');
axis off;

% Highlight the path edges and nodes
highlight(p, Path3_10, 'EdgeColor', 'g', 'LineWidth', 2);
highlight(p, Path3_10, 'NodeColor', 'r');

% Find all paths from Node 3 to Node 10
allPaths3_10_raw = allpaths(G, 3, 10);

% Filter by TTL (max 10 hops = max 11 nodes)
TTL = 10;
allPaths3_10 = allPaths3_10_raw(cellfun(@(p) length(p) <= TTL, allPaths3_10_raw));

% Display the number of paths and each path
fprintf('Total number of paths from Node 3 to Node 10 (TTL <= %d): %d\n', TTL, length(allPaths3_10));
for i = 1:length(allPaths3_10)
    fprintf('Path %d: %s\n', i, mat2str(allPaths3_10{i}));
end


