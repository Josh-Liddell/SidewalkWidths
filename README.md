# Sidewalk Widths

A dockerized jupyter notebook server for using the [SidewalkAI](https://github.com/MIT-Senseable-City-Lab/SidewalkAI) pipeline with [Road-Segmentation](https://github.com/JunHyeok96/Road-Segmentation)

### Instructions

1. Build the image
```docker build -t sidewalkwidths .```

2. Run the container (mapping port 8888)
```docker run -p 8888:8888 sidewalkwidths```

3. Open browser and go to: http://localhost:8888