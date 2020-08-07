from django.urls import path
from . import views


urlpatterns = [
    # loacalhost:8080/
    path('', views.post_list, name='post_list'),
    # localhost:8080/post/5
    path('post/<int:pk>/', views.post_detail, name='post_detail_test'),
    # localhost:8080/post/new
    path('post/new/', views.post_new, name='post_new'),
    # localhost:8080/post/5/edit
    path('post/<int:pk>/edit', views.post_edit, name='post_edit'),
    # localhost:8080/post/5/delete
    path('post/<int:pk>/delete/', views.post_delete, name='post_delete'),
    # localhost:8080/post/5/comment
    path('post/<int:pk>/comment/', views.add_comment_to_post, name='add_comment_to_post'),
    # localhost:8080/comment/5/approve
    path('comment/<int:pk>/approve', views.comment_approve, name='comment_approve'),
    # localhost:8080/comment/5/remove
    path('comment/<int:pk>/remove', views.comment_remove, name='comment_remove'),
]