"""
EduRank Analytics - Educational Performance Analytics System
Main Entry Point
"""

import sys
import os

# Ensure project root is in python path
sys.path.insert(0, os.path.abspath(os.path.dirname(__file__)))

from utils.logger import logger
from services.data_service import DataService
from services.sample_data_generator import SampleDataGenerator
from services.analytics_engine import AnalyticsEngine
from services.exporter_service import ExporterService

from controllers.auth_controller import AuthController
from controllers.student_controller import StudentController
from controllers.marks_controller import MarksController
from controllers.attendance_controller import AttendanceController
from controllers.analytics_controller import AnalyticsController
from controllers.report_controller import ReportController

from gui.app import EduRankApp

def main() -> None:
    """
    Main application bootstrap function. Initializes data persistence,
    sample datasets, analytical services, controllers, and launches Tkinter GUI.
    """
    logger.info("Initializing EduRank Analytics Desktop Application...")

    # 1. Services Layer
    data_service = DataService()
    
    # Auto-generate realistic sample CSV data on initial launch
    sample_generator = SampleDataGenerator(data_service)
    sample_generator.generate_if_needed()

    analytics_engine = AnalyticsEngine(data_service)
    exporter_service = ExporterService(data_service, analytics_engine)

    # 2. Controllers Layer
    auth_controller = AuthController(data_service)
    student_controller = StudentController(data_service)
    marks_controller = MarksController(data_service)
    attendance_controller = AttendanceController(data_service)
    analytics_controller = AnalyticsController(data_service, analytics_engine)
    report_controller = ReportController(exporter_service)

    # 3. Launch GUI
    logger.info("Starting Tkinter Graphical User Interface...")
    app = EduRankApp(
        data_service=data_service,
        analytics_engine=analytics_engine,
        exporter_service=exporter_service,
        auth_controller=auth_controller,
        student_controller=student_controller,
        marks_controller=marks_controller,
        attendance_controller=attendance_controller,
        analytics_controller=analytics_controller,
        report_controller=report_controller
    )
    app.mainloop()
    logger.info("EduRank Analytics Application closed cleanly.")

if __name__ == "__main__":
    main()
