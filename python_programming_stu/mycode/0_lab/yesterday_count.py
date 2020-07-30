#file open
#mode : r(read), w(write), a(append), rb, wb(binary file)
file = open('yesterday.txt', 'r')
#file의 내용을 읽은 값을 저장한 변수
yesterday_lyric = ''
while 1:
    line = file.readline()
    if not line:
        break
    yesterday_lyric = yesterday_lyric + line.strip() + '\n'
    #yesterday_lyric += line

print(yesterday_lyric)
#file 읽기 종류
file.close()
print(len(yesterday_lyric))

n_of_YESTERDAY = yesterday_lyric.upper().count('YESTERDAY')
print('Number of a word YESTERDAY', n_of_YESTERDAY)
