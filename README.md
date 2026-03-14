# docker-optimization-lab.
A hands-on lab demonstrating Docker layer optimization. Reduced build times by 98% by re-engineering the Dockerfile to leverage caching for heavy Python dependencies (Pandas/Numpy).


# Docker Build Optimization: Layer Caching Lab 

## Project Overview
This project demonstrates a critical DevOps optimization: **Docker Layer Caching**. 
As a Civil Engineer turned MBA student with a DevOps background, I focused on improving the "Construction Process" of this container to reduce developer wait time and resource consumption.

## The Problem (Unoptimized Build)
Initially, the Dockerfile used a "bulk copy" method (`COPY . .`). 
- **The Bottleneck:** Any tiny change in the Python source code forced Docker to reinstall heavy libraries (Pandas/Numpy).
- **Result:** Build times were consistently 2–3 minutes, even for 1-line code changes.

## The Solution (The "DevOps" Way)
I re-engineered the Dockerfile to separate the **Environment Setup** from the **Application Logic**.

### Optimized Dockerfile Strategy:
1. **Foundation:** Used `python:3.11-slim` for a smaller footprint.
2. **Dependency Layer:** Copied `requirements.txt` and ran `pip install` first.
3. **Application Layer:** Copied the source code last.



## Results
- **First Build:** ~2 minutes (Initial setup).
- **Subsequent Builds (Code Changes):** **< 1 second** (99% reduction in build time).
- **Technical Insight:** By leveraging Docker's cache, we "freeze" the heavy installation layer, ensuring it only re-runs if the dependencies actually change.

## How to Run
1. Build the image: `docker build -t slow-pipeline:v2 .`
2. Run the container: `docker run slow-pipeline:v2`
