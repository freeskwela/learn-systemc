

from PySide6.QtCore import QSize
from PySide6.QtWidgets import QMainWindow, QPushButton, QHBoxLayout


class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()

        self.setWindowTitle('TryLangPo!')
        self.setFixedSize(QSize(600, 300))

        btn1 = QPushButton('Weeweeet!')
        self.setCentralWidget(btn1)
