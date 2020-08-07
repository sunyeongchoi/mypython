from django.db import models
from django.utils import timezone
from django import forms

def min_length_3_validator(value):
    if len(value) < 3:
        raise forms.ValidationError('제목은 3글자 이상 입력해주세요')


# Create your models here.
class Post(models.Model):
    # 작성자
    author = models.ForeignKey('auth.User', on_delete=models.CASCADE)
    # 제목
    title = models.CharField(max_length=200, validators=[min_length_3_validator])
    # 내용
    text = models.TextField()
    # 작성일자
    created_date = models.DateTimeField(default=timezone.now)
    # 게시일자
    published_date = models.DateTimeField(blank=True, null=True)
    # 필드 추가 - 삭제할 예정
    #test = models.TextField()

    # 게시 일자에 현재 날짜를 대입해주는 함수
    def publish(self):
        self.published_date = timezone.now()
        self.save()

    # 객체 주소 대신 글제목을 반한해주는 toString()함수
    def __str__(self):
        return self.title

    def approved_comments(self):
        return self.comments.filter(approved_comment=True)

class Comment(models.Model):
    post = models.ForeignKey('blog.Post', on_delete=models.CASCADE, related_name='comments')
    author = models.CharField(max_length=200)
    text = models.TextField()
    created_date = models.DateTimeField(default=timezone.now)
    approved_comment = models.BooleanField(default=False)

    def approve(self):
        self.approved_comment = True
        self.save()

    def __str__(self):
        return self.text

