import serial
from pynput.keyboard import Controller
import time

ser = serial.Serial('COM4', 9600)  # Arduino'nun bağlı olduğu COM portu ve baud hızı
keyboard = Controller()

while True:
    if ser.in_waiting > 0:
        char = ser.readline().decode('utf-8').strip()  # Gelen veriyi oku ve temizle
        if char == 'c':
            print("C tuşuna basılıyor")
            keyboard.press('c')  
            time.sleep(0.1)      
            keyboard.release('c') 
        
        if char == 'd':
            print("D tuşuna basılıyor")
            keyboard.press('d')  
            time.sleep(0.1)      
            keyboard.release('d') 
        
            
        if char == 's':
            print("S tuşuna basılıyor")
            keyboard.press('s')  
            time.sleep(0.1)      
            keyboard.release('s') 
        
        if char == 'w':
            print("W tuşuna basılıyor")
            keyboard.press('w')  
            time.sleep(0.1)     
            keyboard.release('w')
        if char == 'a':
            print("A tuşuna basılıyor")
            keyboard.press('a')  
            time.sleep(0.1)      
            keyboard.release('a')