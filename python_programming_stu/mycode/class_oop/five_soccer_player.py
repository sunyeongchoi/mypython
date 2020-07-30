# 2차원 리스트를 사용해서 5명의 player 정보를 저장하기
names = ['둘리', '길동', '지성', '흥민', '범근']
positions = ['MF', 'DF', 'CF', 'WF', 'GK']
back_numbers = [10, 15, 20, 30, 1]

# zip 함수
for na,po,nu in zip(names, positions, back_numbers):
    print(na,po,nu)
players = [[na,po,nu] for na,po,nu in zip(names, positions, back_numbers)]
print(players)
son = players[3]
print(son)
back_number = son[2]
print(back_number)
son[2] = 25
print(son)

# SoccerPlayer 클래스를 import
from mycode.class_oop.soccer_player import SoccerPlayer



player1 = SoccerPlayer('플레이어1','MF',10)
print(player1)
player1.change_back_number(20)

players_object = [SoccerPlayer(na,po,nu) for na,po,nu in zip(names,positions,back_numbers)]
print(players_object)

son = players_object[3]
print(son)
son.change_back_number
