'''
Created on Mar 12, 2018

@author: nhatnguyen
'''
from django.urls import path
from . import views


urlpatterns = [
    path(r'', views.index, name='index'),
    path(r'<int:question_id>', views.detail, name='detail'),
    path(r'<int:question_id>/result', views.result, name='result'),
    path(r'<int:question_id>/vote', views.vote, name='vote'),
]