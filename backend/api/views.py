from django.shortcuts import render
from django.contrib.auth.models import User
from rest_framework import generics
from .serializers import UserSerializer
from rest_framework.permissions import IsAuthenticated, AllowAny

# View to create a new user, anyone can call it to create a new user (ex: Unauthenticated users)
class CreateUserView(generics.CreateAPIView):
    queryset = User.objects.all()
    serializer_class =  User
    permission_classes = [AllowAny]
