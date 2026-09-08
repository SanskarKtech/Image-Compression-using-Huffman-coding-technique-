MATLAB Image Compression Using Huffman Coding
📌 Project Overview
This project implements image compression using Huffman Coding in MATLAB.
The system analyzes the pixel intensity distribution of an image, calculates symbol probabilities, constructs a Huffman tree, generates variable-length Huffman codes, encodes the image data, and evaluates the compression performance.
The project also provides a comparison between the original and reconstructed image and calculates important compression parameters.
________________________________________
🎯 Objectives
1Implement Huffman coding for image compression.
Analyze the frequency and probability of image pixels.
Construct and visualize the Huffman tree.
Generate Huffman codes for image symbols.
Encode image data using Huffman coding.
Decode the compressed data.
Reconstruct the original image.
Calculate entropy and average Huffman code length.
Calculate coding efficiency.
Calculate compression ratio and related performance metrics.
Compare the original and reconstructed images.
________________________________________
🧠 Principle
Huffman coding is a lossless data compression technique.
The basic idea is to assign:
	Shorter binary codes to frequently occurring symbols.
	Longer binary codes to less frequently occurring symbols.
For an image, pixel intensity values are treated as symbols.
The Huffman algorithm repeatedly combines the two symbols or nodes having the lowest probabilities until a complete binary tree is obtained.
The resulting tree is then used to generate the Huffman code for each pixel value.
________________________________________
🔄 System Workflow
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
________________________________________
📊 Parameters Calculated
The project calculates the following parameters:
1. Entropy
Entropy represents the theoretical minimum average number of bits required to represent the image symbols.
H=P_K Log(1/P_K )
where:
	P_K= probability of occurrence of the ith pixel value
	H = entropy in bits/symbol
2. Average Huffman Code Length
    L=P_K*l_K
where:
	l_K = length of the Huffman code
	L = average code length
3. Coding Efficiency
       η=H/L*100%
Higher coding efficiency indicates that the Huffman code is closer to the theoretical entropy limit.
________________________________________
🛠️ Technologies Used
	MATLAB
	Huffman Coding
	Digital Image Processing
	Information Theory
	Lossless Data Compression
________________________________________
💻 Requirements
	MATLAB
	Image Processing Toolbox if required by the implementation
________________________________________
▶️ How to Run
	Download or clone this repository.
	Open MATLAB.
	Set the repository folder as the MATLAB working directory.
	Open the main MATLAB file.
	Select an input image.
	Run the program.
	Observe the Huffman calculation and compression results.
________________________________________
📷 Results
Original Image
 <img width="975" height="610" alt="image" src="https://github.com/user-attachments/assets/e137e3ba-8d3f-4c8c-92a1-00449f6150b9" />

Reconstructed Image
 <img width="724" height="489" alt="image" src="https://github.com/user-attachments/assets/c853d276-4627-46ae-be61-6d3fb8553526" />

Huffman Tree
 <img width="975" height="411" alt="image" src="https://github.com/user-attachments/assets/4817b9a5-fdc1-497d-8eb9-b6c97a231c52" />

Performance Analysis
 <img width="758" height="819" alt="image" src="https://github.com/user-attachments/assets/3f978a3c-d992-47ab-9d55-f23c6e8d1ffc" />

________________________________________
📈 Features
	Image input and processing
	Pixel frequency analysis
	Probability calculation
	Entropy calculation
	Huffman tree construction
	Huffman code generation
	Image encoding
	Image decoding
	Image reconstruction
	Compression performance analysis
	Graphical visualization of results
________________________________________
🔬 Type of Compression
Lossless compression
The Huffman coding process does not intentionally remove image information. After decoding, the reconstructed image can be identical to the encoded input when the implementation preserves all required image data.
________________________________________
🚀 Future Scope
	Extend the system to color images.
	Compare Huffman coding with other compression techniques.
	Implement hybrid compression using DCT and Huffman coding.
	Develop a GUI-based image compression application.
	Optimize the algorithm for large images.
	Implement real-time compression analysis.
________________________________________
👨‍💻 Project
Topic: Image Compression Using Huffman Coding
Platform: MATLAB
Domain: Digital Communication
Compression Type: Lossless
