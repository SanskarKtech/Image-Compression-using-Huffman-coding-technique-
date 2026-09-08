# Optimized Huffman Image Compression - MATLAB

## Run
1. Open MATLAB.
2. Set the project folder as the Current Folder.
3. Run `main.m`.

## Important
The backend does NOT call `huffmandict`, `huffmanenco`, or `huffmandeco`.
The Huffman tree, node merging, code generation, encoding, decoding,
entropy, average code length and efficiency are calculated explicitly.

## GUI buttons
- Project Info
- Image Info
- Detailed Results
- Compression Graph
- Huffman Calculation
- Huffman Tree
- Encoded Stream

## Backend flow
Image -> grayscale -> frequency -> probability -> entropy ->
Huffman tree -> 0/1 codes -> encoding -> decoding -> verification.

## Note on compressed size
The encoded stream size is the theoretical Huffman payload.
A real compressed file also requires metadata such as the tree/dictionary.
The program therefore reports an estimated tree overhead separately.
