from django.urls import path
from . import views

urlpatterns = [
    # Exemplo de endpoint
    path('hello/', views.example_view, name='hello'),
]
