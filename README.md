# EduRank Analytics - Educational Performance Analytics System

**EduRank Analytics** is a complete, production-ready desktop educational performance analytics system built with Python 3.12+, Tkinter, Pandas, NumPy, and Matplotlib. It evaluates students beyond traditional examination marks by incorporating attendance, assignment tracking, internal tests, semester exams, classroom participation, and behavioral discipline metrics.

---

## 🌟 Key Features

1. **Role-Based Authentication System**
   - **Admin Login** & **Teacher Login** with role permissions.
   - Demo Credentials:
     - **Admin**: Username `admin` | Password `admin123`
     - **Teacher**: Username `teacher` | Password `teacher123`

2. **Student Management Directory (CRUD)**
   - Complete management of student profiles (ID, Name, Gender, Department, Year, Section, Phone, Email).
   - Real-time search filtering across names, IDs, departments, and emails.
   - Modal form dialogs for adding and editing records.

3. **Subject & Curriculum Management**
   - Add subjects, define credit hours, and assign courses across departments.

4. **Marks & Examination Engine**
   - Track scores across 5 components: **Internal 1**, **Internal 2**, **Assignment**, **Mid Exam**, and **Semester Exam**.
   - Automatic real-time calculation of **Subject Average**, **Overall Average**, **Percentage**, **Grade (A+ to F)**, and **GPA (4.0 scale)**.

5. **Attendance Tracking Module**
   - Store Total Held Classes, Present Sessions, and Absent Sessions.
   - Dynamic percentage calculation and status badges (**Eligible $\ge 75\%$**, **Warning $65-74\%$**, **Shortage $< 65\%$**).

6. **Assignment Tracker**
   - Record assignment titles, due/submission dates, marks obtained, and status (**Submitted**, **Late**, **Pending**).

7. **Classroom Behavioral Assessment**
   - Assign quantitative scores for **Participation**, **Discipline**, and **Communication Skills** out of 100.

8. **Weighted Performance Analytics Engine**
   - Calculates overall performance score using weighted formula:
     $$\text{Score} = (20\% \times \text{Attendance}) + (20\% \times \text{Assignments}) + (20\% \times \text{Internal Tests}) + (30\% \times \text{Semester Exam}) + (10\% \times \text{Participation})$$
   - Classifies students into: **Excellent ($\ge 85\%$)**, **Good ($70-84\%$)**, **Average ($50-69\%$)**, **Needs Improvement ($< 50\%$)**.

9. **Interactive Dashboard & Matplotlib Visualization**
   - Real-time KPI summary stat cards (**Total Students**, **Average Attendance %**, **Top Performer**, **At Risk Count**).
   - Embedded Matplotlib figures (Performance Distribution Pie Chart, Department Average Bar Chart, Attendance vs Marks Scatter Plot).

10. **Reports & CSV Export Engine**
    - Instant preview and one-click CSV exporting for:
      - Student Performance Report
      - Attendance Report
      - Top 10 Students Report
      - Weak Students Report
      - Department Wise Summary Report

11. **🚀 Bonus Features**
    - **Student Rank Prediction**: Linear trend trajectory projection based on internal vs semester exam acceleration.
    - **Attendance vs Marks Correlation**: Pearson correlation coefficient ($\text{r}$) calculated dynamically via NumPy.
    - **Weak Subject Detection**: Automated identification of subjects scoring below $50\%$ or class average.
    - **Personalized Recommendations**: Tailored actionable guidance generated for each student.
    - **Early Warning System**: Automated flagging of students at risk of attendance shortage or exam failure.

---

## 🛠️ Technology Stack

- **Python 3.12+**
- **GUI Framework**: Tkinter & `ttk` with custom styling
- **Data Analysis & Analytics**: Pandas & NumPy
- **Data Visualization**: Matplotlib (`backend_tkagg`)
- **Data Persistence**: CSV files (with automatic schema fallback)
- **Logging**: Python `logging` module writing to `app.log` and console
- **Architecture**: Modular Object-Oriented Programming (OOP) with Model-View-Controller (MVC) separation.

---

## 📁 Project Folder Structure

```
EduRankAnalytics/
├── main.py                          # Main application entry point & bootstrap
├── requirements.txt                 # Project dependencies
├── README.md                        # Complete documentation & user guide
├── app.log                          # Generated application runtime log
├── gui/
│   ├── __init__.py
│   ├── styles.py                    # Design tokens & dark/navy ttk theme
│   ├── app.py                       # Main container frame & switcher
│   ├── login_view.py                # Authentication screen
│   ├── dashboard_view.py            # Dashboard with embedded Matplotlib charts
│   ├── student_view.py              # Student CRUD interface
│   ├── subject_view.py              # Subject management view
│   ├── marks_view.py                # Marks entry & grade/GPA preview
│   ├── attendance_view.py           # Attendance tracker & status badges
│   ├── assignment_view.py           # Assignment tracker & status
│   ├── participation_view.py        # Behavioral score inputs
│   ├── analytics_view.py            # Rank prediction, correlations, warnings
│   ├── reports_view.py              # Interactive report preview & CSV exporter
│   └── components/
│       ├── __init__.py
│       ├── nav_sidebar.py           # Sidebar navigation panel
│       ├── stat_card.py             # Dashboard KPI card widget
│       ├── table_view.py            # Custom Treeview wrapper with scrollbars
│       └── chart_frame.py           # Matplotlib figure embedder
├── models/
│   ├── user.py                      # User dataclass
│   ├── student.py                   # Student profile dataclass
│   ├── subject.py                   # Subject dataclass
│   ├── marks.py                     # Marks & GPA model
│   ├── attendance.py                # Attendance record model
│   ├── assignment.py                # Assignment submission model
│   ├── participation.py            # Participation model
│   └── analytics.py                 # Performance summary dataclass
├── controllers/
│   ├── auth_controller.py           # Login/logout authentication controller
│   ├── student_controller.py        # Student CRUD operations controller
│   ├── marks_controller.py          # Marks & subject evaluation controller
│   ├── attendance_controller.py     # Attendance processing controller
│   ├── analytics_controller.py      # Analytics aggregator controller
│   └── report_controller.py         # Report generation & CSV exporter controller
├── services/
│   ├── data_service.py              # Safe CSV persistence manager (Pandas)
│   ├── sample_data_generator.py     # Automatic realistic sample data populator
│   ├── analytics_engine.py          # Statistical & weighted scoring engine
│   └── exporter_service.py          # Formats and writes CSV reports
├── utils/
│   ├── logger.py                    # Centralized logging setup
│   ├── validators.py                # Input validation functions
│   └── helpers.py                   # GPA conversion & scoring utilities
├── data/                            # Persistent CSV storage directory
├── reports/                         # Storage directory for exported CSV reports
└── graphs/                          # Storage for generated figure artifacts
```

---

## ⚡ Quick Start Guide

### 1. Prerequisites
Ensure Python 3.12+ is installed on your system.

### 2. Install Dependencies
Install required packages using `pip`:
```bash
pip install -r requirements.txt
```

### 3. Run the Application
Simply execute the entry point script:
```bash
python main.py
```

*Note: On initial launch, sample CSV files in `data/` will be automatically generated with sample student records, marks, and attendance metrics.*
