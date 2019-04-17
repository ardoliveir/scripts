import smtplib
import argparse

server = smtplib.SMTP('smtp.gmail.com', 587)
server.starttls()
server.login("USER", "PASS")
de = 'FROM'
para = ['TO']
msg ="""From: %s
To %s
Subject: TEXT
BODY.""" % (de, ', '.join(para))
server.sendmail("FROM", "TO",msg)
server.quit()
