from django.shortcuts import render
from django.contrib.auth.models import User
from rest_framework import generics
from .serializers import UserSerializer, NoteSerializer
from rest_framework.permissions import IsAuthenticated, AllowAny
from django.http import JsonResponse
from .models import Note


# View to create a new user, anyone can call it to create a new user (ex: Unauthenticated users)

class NoteListCreate(generics.ListCreateAPIView):
    serializer_class = NoteSerializer
    permission_classes = [IsAuthenticated]  # only logged-in users can create notes

    def get_queryset(self):
        user = self.request.user
        return

    def perform_create(self, serializer):
        if serializer.is_valid():
            serializer.save(author=self.request.user)
        else:
            print(serializer.errors)



class CreateUserView(generics.CreateAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    permission_classes = [AllowAny]  # unauthorized users should be able to create accounts


def example_view(request):
    return JsonResponse({"message": "Hello, API!"})
