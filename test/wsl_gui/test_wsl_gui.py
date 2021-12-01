
from PySide6.QtWidgets import QApplication
import sys

from widgets.window_main import MainWindow


if __name__=='__main__':

    app = QApplication(sys.argv)

    window = MainWindow()
    window.show()

    # start the event loop
    app.exec_()
