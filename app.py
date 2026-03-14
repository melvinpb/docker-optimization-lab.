import pandas as pd
import numpy as np
import time

def main():
    print("--- The Slow Pipeline App (Version 2) ---")
    df = pd.DataFrame(np.random.randn(10, 4), columns=list('ABCD'))
    print("Generated Random Data Matrix:")
    print(df)
    print("\nProcessing complete. Hello from Docker!")

if __name__ == "__main__":
    main()