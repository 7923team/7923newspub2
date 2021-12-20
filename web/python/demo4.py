#-*- codeing=utf-8 -*-
#@Time : 2021/12/17 14:53
#@Author :费昊
#@File : demo3.py
#@Software : PyCharm


# password='mysql'
# database='newsdb'
# open("news.txt"
# wc.to_file('imge/wbcy.png')



from wordcloud import  WordCloud,ImageColorGenerator
from imageio import imread
import jieba
from collections import Counter
from PIL import Image
import numpy as np
import pymysql

#连接数据库
db = pymysql.connect(host='localhost',port=3306,user='root',password='sblive15s0323',database='newsdb2',charset='utf8')
#用来调用sql语句
cur=db.cursor()
sql = 'delete from w_stat'
cur.execute(sql)

sql = 'SELECT CONTENT FROM NEWS'

#执行sql语句
cur.execute(sql)
data = cur.fetchall()
# print(data)
# print(type(data))



with open('news.txt','w',encoding='utf-8') as n:
    for i in range(len(data)):
        n.write(data[i][0])
report = open("news.txt",'r',encoding='utf-8').read()

# 4. 用jieba库中的cut()函数进行分词
words = jieba.cut(report)  # 传入的就是上面汇总的title_all

# 5. 通过for循环语句提取长度大于等于两个字的词
report_words = []
for word in words:
    if len(word) >= 2:
        report_words.append(word)
# print(report_words)

# 6. 获取词频最高的10个词
result = Counter(report_words).most_common(10)

sql = 'insert into w_stat(id,name,num) values(%s,%s,%s)'
for i in range(len(result)):
    cur.execute(sql,(int(i+1),result[i][0],result[i][1]))
    print(result[i][0],result[i][1])

db.commit()
cur.close()
db.close()
with open('imge/ciyun.txt','w',encoding='utf-8') as f:
    f.write('<%@page language="java" contentType="text/html;charset=UTF-8"%>')
    f.write('\n')
    for i in result:

        f.write(str(i[0])+'--'+str(i[1]))
        f.write('\n')
# print(result)

# 7. 按特定形状和特定颜色绘制词云图
# （1）获取词云图的形状蒙版
background_pic = 'imge/wb.jpeg'
images = Image.open(background_pic)
maskImages = np.array(images)

# （2）按照形状蒙版绘制词云图
content = ' '.join(report_words)
wc = WordCloud(font_path='wq.ttf',
               background_color='white',
               width=1000,
               height=600,
               mask=maskImages
               ).generate(content)

# （3）修改词云图的颜色
back_color = imread(background_pic)
image_colors = ImageColorGenerator(back_color)
wc.recolor(color_func=image_colors)

wc.to_file('imge/wbcy.png')
