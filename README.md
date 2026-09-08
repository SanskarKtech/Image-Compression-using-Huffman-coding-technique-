# MATLAB Image Compression Using Huffman Coding

## 📌 Project Overview

This project implements image compression using **Huffman Coding** in MATLAB.

The system analyzes the pixel intensity distribution of an image, calculates symbol probabilities, constructs a Huffman tree, generates variable-length Huffman codes, encodes the image data, and evaluates the compression performance.

The project also provides a comparison between the original and reconstructed image and calculates important compression parameters.

---

## 🎯 Objectives

* Implement Huffman coding for image compression.
* Analyze the frequency and probability of image pixels.
* Construct and visualize the Huffman tree.
* Generate Huffman codes for image symbols.
* Encode image data using Huffman coding.
* Decode the compressed data.
* Reconstruct the original image.
* Calculate entropy and average Huffman code length.
* Calculate coding efficiency.
* Calculate compression ratio and related performance metrics.
* Compare the original and reconstructed images.

---

## 🧠 Principle

Huffman coding is a **lossless data compression technique**.

The basic idea is to assign:

* Shorter binary codes to frequently occurring symbols.
* Longer binary codes to less frequently occurring symbols.

For an image, pixel intensity values are treated as symbols.

The Huffman algorithm repeatedly combines the two symbols or nodes having the lowest probabilities until a complete binary tree is obtained.

The resulting tree is then used to generate the Huffman code for each pixel value.

---

## 🔄 System Workflow

```text
Input Image
     ↓
Read Image
     ↓
Convert to Grayscale
     ↓
Calculate Pixel Frequencies
     ↓
Calculate Probabilities
     ↓
Calculate Entropy
     ↓
Build Huffman Tree
     ↓
Generate Huffman Codes
     ↓
Encode Image
     ↓
Store Compressed Data
     ↓
Decode Data
     ↓
Reconstruct Image
     ↓
Calculate Compression Metrics
```

---


## 🛠️ Technologies Used

* MATLAB
* Huffman Coding
* Digital Image Processing
* Information Theory
* Lossless Data Compression

---

## 💻 Requirements

* MATLAB
* Image Processing Toolbox if required by the implementation

---

## ▶️ How to Run

1. Download or clone this repository.
2. Open MATLAB.
3. Set the repository folder as the MATLAB working directory.
4. Open the main MATLAB file.
5. Select an input image.
6. Run the program.
7. Observe the Huffman calculation and compression results.

---

## 📷 Results

### Original Image

![Uploading image.png…]()



### Reconstructed Image

<img width="975" height="411" alt="image" src="https://github.com/user-attachments/assets/dfe160b5-f03f-4f7c-9b35-cab15bf100b8" />


### Huffman Tree

<img width="724" height="489" alt="image" src="https://github.com/user-attachments/assets/b505943b-a2e6-425d-8fdc-fb44a6f222da" />


### Performance Analysis

<img width="758" height="819" alt="image" src="https://github.com/user-attachments/assets/23efe0c7-9be3-4e20-8b75-ad0f283c87d6" />

---

## 📈 Features

* Image input and processing
* Pixel frequency analysis
* Probability calculation
* Entropy calculation
* Huffman tree construction
* Huffman code generation
* Image encoding
* Image decoding
* Image reconstruction
* Compression performance analysis
* Graphical visualization of results

---

## 🔬 Type of Compression

**Lossless compression**

The Huffman coding process does not intentionally remove image information. After decoding, the reconstructed image can be identical to the encoded input when the implementation preserves all required image data.

---

## 🚀 Future Scope

* Extend the system to color images.
* Compare Huffman coding with other compression techniques.
* Implement hybrid compression using DCT and Huffman coding.
* Develop a GUI-based image compression application.
* Optimize the algorithm for large images.
* Implement real-time compression analysis.

---

## 👨‍💻 Project

**Topic:** Image Compression Using Huffman Coding
**Platform:** MATLAB
**Domain:** Digital Communication / Image Processing
**Compression Type:** Lossless
