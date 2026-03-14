# Step 1: Foundation
FROM python:3.11-slim

# Step 2: Workbench
WORKDIR /app

# Step 3: Copy ONLY the parts list (The "Heavy" dependency file)
# This is the secret! We don't copy app.py yet.
COPY requirements.txt .

# Step 4: The Heavy Construction (Installation)
# Docker will cache this entire layer.
RUN pip install --no-cache-dir -r requirements.txt

# Step 5: Copy the actual code (The "Light" part)
# Since this is at the end, changes here won't break the pip install cache!
COPY app.py .

# Step 6: Turn on the lights
CMD ["python", "app.py"]