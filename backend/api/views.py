from django.shortcuts import render
from django.contrib.auth.models import User
from rest_framework import generics
from .serializers import UserSerializer
from rest_framework.permissions import IsAuthenticated, AllowAny
from django.http import JsonResponse


# View to create a new user, anyone can call it to create a new user (ex: Unauthenticated users)
class CreateUserView(generics.CreateAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    permission_classes = [AllowAny]


def example_view(request):
    return JsonResponse({"message": "Hello, API!"})
