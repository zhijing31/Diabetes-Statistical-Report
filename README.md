## 📝 Project Title: Diabetes Prediction and Analysis

This project investigates key health indicators associated with diabetes using classification models.

---

## 📁 Folder Contents

- `Diabetes.R` – Main R script used for data preparation, model training, and evaluation.
- `Diabetes.pdf` – Project report detailing methodology, results, and interpretation.

---

## 📌 Project Overview

### 🩺 Background
Diabetes is one of the most prevalent chronic diseases globally. This project uses a dataset containing **70,692 survey responses** from the US (2015) to explore patterns and build predictive models.

### 🎯 Objectives
- Identify significant predictors of diabetes
- Compare classification models: **Naïve Bayes** vs **K-Nearest Neighbors (KNN)**
- Evaluate model performance using cross-validation
- Recommend the most effective model for diabetes classification

---

## 📊 Methodology

### 🔍 Data Preprocessing
- Selected 9 significant features (e.g., HighBP, GenHlth, BMI, Age)
- Filtered and cleaned data for modeling

### 🧪 Models Used
- **Naïve Bayes**:
  - Categorical classification
  - Cross-validation used to calculate mean accuracy: **~71%**
  
- **K-Nearest Neighbors**:
  - Used for numerical classification
  - Tested values of `k` from 1 to 20
  - Highest accuracy: **~72.4%** when `k = 20`

### 📈 Model Comparison
- KNN showed slightly higher accuracy than Naïve Bayes
- However, KNN is more computationally intensive and sensitive to outliers

---

## 🧠 Key Learnings
- Feature selection is crucial in improving model accuracy
- Trade-off exists between model accuracy and computational efficiency
- Cross-validation is an effective method to assess model generalizability

---

## 📄 Report
📑 [Diabetes Statistical Report](https://github.com/zhijing31/Diabetes-Statistical-Report/blob/main/Diabetes.pdf)
