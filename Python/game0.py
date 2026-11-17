import sys
from PyQt5.QtWidgets import QApplication, QWidget   #, QLabel
#from PyQt5.QtCore import Qt

def main():
    app = QApplication(sys.argv)

    # 2. O Palco: Criamos um Widget (window básica)
    window = QWidget()
    window.setWindowTitle("PyQt - Passo 1: O Palco")
    window.resize(480, 270)

    window.setStyleSheet("background-color: #00C800;")


    #texto = QLabel("O Palco", window)
    #texto.setGeometry(0, 100, 432, 40) # x, y, largura, altura
    #texto.setAlignment(Qt.AlignCenter) # Centraliza o texto
    #texto.setStyleSheet("font-size: 24px; font-weight: bold; color: white;")

    window.show()

    sys.exit(app.exec_())

if __name__ == "__main__":
    main()








