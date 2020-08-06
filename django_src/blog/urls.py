from django.urls import path
from . import views


urlpatterns = [
    # loacalhost:8080/
    path('', views.post_list, name='post_list')
]