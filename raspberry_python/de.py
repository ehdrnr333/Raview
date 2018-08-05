import cv2
import numpy as np
import base64
import requests,json
import datetime
URL = 'https://raview-210910.appspot.com/receiveImg'
cascade_src = 'cars.xml'

def showVideo():
	car_cascade = cv2.CascadeClassifier(cascade_src)
	try:
		cap = cv2.VideoCapture(0)
	except:
		return
	while True:
		ret, origin = cap.read()
		if not ret:
			break

		gray = cv2.cvtColor(origin, cv2.COLOR_BGR2GRAY)
		cars = car_cascade.detectMultiScale(gray, 1.1, 1)
		for (x,y,w,h) in cars:
			cv2.rectangle(origin,(x,y),(x+w,y+h),(0,0,255),2)
		countCar = len(cars)
		time = datetime.datetime.now()
		cv2.imshow('origin', origin)

		frame = cv2.resize(origin, (32, 32), interpolation=cv2.INTER_CUBIC)
		ret, buf = cv2.imencode('.jpg', frame)
		base_byte = base64.b64encode(buf)
		orgin = str(base_byte)
		body = orgin[815:-1]
		params = {'gps':'100','time':time, 'countCar':countCar, 'base64':body}
		r = requests.post(url=URL, data=params) 
		print(r)
		#cv2.imshow('frame', frame)
		k = cv2.waitKey(1)&0xFF
		if k==27:
			break
	cap.release()
	cv2.destroyAllWindows()
showVideo()
