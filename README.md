# CRC_micro_ssnml

# Colorectal Cancer (CRC) Metagenomic Analysis

## Project Overview

This repository contains the code and analysis for a comprehensive metagenomic study focused on colorectal cancer (CRC). The project aims to investigate the microbial community differences between CRC patients and healthy controls using various bioinformatics approaches.

## Key Features

- Diversity analysis (alpha and beta diversity)
- Network construction and analysis
- Identification of hub species
- Differential abundance analysis (LEfSe)

## Requirements

This project is implemented in R. The main dependencies include:

- R (version 4.0.0 or higher)
- ggClusterNet
- phyloseq
- vegan
- microeco
- igraph
- ggplot2
- tidyverse

For a complete list of dependencies, please refer to the `requirements.txt` file.

## Data

The analysis is based on a metagenomic dataset comparing CRC patients with healthy controls. Due to privacy concerns, the raw data is not included in this repository. A processed, anonymized version of the data (`dataset.rda`) is used for the analysis.

## Code Structure

- `Diversity.R`: Scripts for alpha and beta diversity analysis
- `Co-occurence_Network.R`: Code for microbial network construction and hub species identification


## Usage

1. Clone this repository
2. Install the required R packages
3. Run the R scripts

## Results

The main findings of this study include:

- Significant differences in alpha and beta diversity between CRC and control groups
- Discovery of differentially abundant taxa between CRC and control groups
- Construct the co-ocuurence network
- Identification of key hub species in the microbial network
- SSN parameter generation and Machine learning

Detailed results and visualizations can be found in the `results` directory.

## Contributing

We welcome contributions to improve the analysis or extend the project. Please feel free to submit issues or pull requests.

## License

This project is licensed under the MIT License - see the `LICENSE.md` file for details.

## Contact

For any queries regarding this project, please open an issue on this GitHub repository.
