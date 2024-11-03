# Efficiency Assessment of Material Handling Robots

## Project Overview

This project aims to evaluate the efficiency of 27 material handling robots using the Data Envelopment Analysis (DEA) methodology, specifically the CCR input-oriented model. The analysis focuses on several performance parameters, including cost, repeatability, load capacity, and velocity. By assessing the efficiency of these robots, we can identify targets for improvement and establish benchmarks for competitiveness in the industry.

## Problem Description

### Parameters for Evaluation

The evaluation of the robots is based on the following parameters:

- **Inputs:**
  - Cost (in $10,000)
  - Repeatability (in mm)

- **Outputs:**
  - Load Capacity (in Kg)
  - Velocity (in m/s)

### Dataset

The dataset includes performance data for 27 material handling robots, with metrics on cost, repeatability, load capacity, and velocity. This data is crucial for conducting the DEA analysis.

### Objectives

The project aims to achieve the following objectives:

1. **Efficiency Assessment**: Develop a MATLAB function that implements the DEA CCR input-oriented model to assess the efficiency of the material handling robots.
2. **Identify Targets for Improvement**: Determine the performance targets that inefficient robots need to achieve to be considered competitive in the market.

## Methodology

### 1. Data Envelopment Analysis (DEA)

The DEA methodology will be employed to evaluate the efficiency of the robots based on the provided input and output data. The CCR (Charnes, Cooper, and Rhodes) model will be utilized in the input-oriented form, which focuses on minimizing inputs while maintaining outputs.

### 2. MATLAB Implementation

A MATLAB function will be developed to perform the following tasks:
- Read the dataset of robot performance metrics.
- Calculate the efficiency scores for each robot using the DEA CCR model.
- Identify the inefficient units and determine their respective targets for improvement based on the efficiency analysis.

## Expected Outcomes

The project is expected to yield:
- Efficiency scores for each of the 27 material handling robots.
- Identification of inefficient units along with specific targets they should aim to achieve in terms of cost, repeatability, load capacity, and velocity to enhance their competitiveness.

## Future Enhancements

- **Sensitivity Analysis**: Conduct a sensitivity analysis to understand how changes in input and output parameters affect efficiency scores.
- **Extended DEA Models**: Explore other DEA models, such as the BCC (Banker, Charnes, and Cooper) model, to assess efficiency under variable returns to scale.
- **Visualization Tools**: Develop visualization tools within MATLAB to graphically represent the efficiency scores and improvement targets for better interpretability.

## Conclusion

This project provides a structured approach to evaluating the efficiency of material handling robots using DEA methodology. The results will not only highlight the competitive standings of the robots but also offer actionable insights for performance improvement, supporting better decision-making in the selection and utilization of industrial robots.
