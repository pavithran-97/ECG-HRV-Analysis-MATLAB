# Heart Rate Variability (HRV) Analysis using ECG (MATLAB)

## Project Objective
This project focuses on the analysis of Heart Rate Variability (HRV) using ECG
signals. The objective is to extract RR intervals from ECG data and compute
time-domain HRV parameters to assess cardiac autonomic activity.

---

## Biomedical Relevance
Heart Rate Variability (HRV) is an important physiological marker used to evaluate
the balance between the sympathetic and parasympathetic nervous systems.
HRV analysis is widely applied in:
- Cardiac health assessment
- Stress and fatigue analysis
- Fitness and wellness monitoring
- Clinical decision support systems

---

## Methodology
1. Synthetic ECG signal generation
2. ECG signal preprocessing using digital filters
   - High-pass filter for baseline wander removal
   - Low-pass filter for high-frequency noise removal
3. R-peak (QRS) detection using peak detection
4. RR interval extraction from detected R-peaks
5. HRV time-domain parameter calculation
6. Visualization of HRV metrics

---

##  Results
The following HRV time-domain parameters were computed:
- **Mean RR Interval** – average time between consecutive heartbeats
- **SDNN** – standard deviation of RR intervals (overall HRV)
- **RMSSD** – root mean square of successive RR differences (short-term HRV)

The RR interval tachogram and HRV parameter bar plot were generated for analysis.

---

##  Tools & Techniques Used
- MATLAB Online
- Biomedical Signal Processing
- Digital Signal Processing techniques
- Peak detection algorithms

---

## Conclusion
This project demonstrates the practical application of biomedical signal
processing techniques for HRV analysis using ECG signals. The extracted HRV
parameters provide insight into cardiac rhythm and autonomic nervous system
activity.

---

## Future Improvements
- Frequency-domain HRV analysis (LF, HF, LF/HF ratio)
- Use of real ECG datasets
- Advanced QRS detection algorithms
- Integration with wearable health data
