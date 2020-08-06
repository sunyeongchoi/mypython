from django.db import models
from django.utils import timezone

# Create your models here.
class Board(models.Model):
    writer = models.ForeignKey('auth.User', on_delete=models.CASCADE)
    title = models.CharField(max_length=150)
    content1 = models.TextField()
    content2 = models.TextField()
    write_date = models.DateTimeField(default=timezone.now)
    published_date = models.DateTimeField(blank=True, null=True)

    # 게시 일자에 현재 날짜를 대입해주는 함수
    def publish(self):
        self.published_date = timezone.now()
        self.save()

    def __str__(self):
        return self.title